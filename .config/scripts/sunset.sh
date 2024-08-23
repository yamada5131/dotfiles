#!/bin/bash

# Startup function
function start() {
	local temp_low=${temp_low:-"3500"}
	local temp_high=${temp_high:-"5600"}
	local duration=${duration:-"900"}
	local sunrise=${sunrise:-"07:00"}
	local sunset=${sunset:-"19:00"}
	local longitude=${longitude:-65}
	local latitude=${latitude:-65}
	local location=${location:-"off"}

	if [[ "${location}" == "on" ]]; then
		if command -v curl &>/dev/null && command -v jq &>/dev/null; then
			local CONTENT
			CONTENT=$(curl -s https://freegeoip.app/json/) || {
				echo "Error: Failed to fetch geo data."
				return 1
			}
			local content_longitude
			content_longitude=$(echo "$CONTENT" | jq -r '.longitude // empty')
			longitude=${content_longitude:-"${longitude}"}
			local content_latitude
			content_latitude=$(echo "$CONTENT" | jq -r '.latitude // empty')
			latitude=${content_latitude:-"${latitude}"}
		else
			echo "Error: curl or jq is not installed."
			return 1
		fi
		wlsunset -l "$latitude" -L "$longitude" -t "$temp_low" -T "$temp_high" -d "$duration" &
	else
		wlsunset -t "$temp_low" -T "$temp_high" -d "$duration" -S "$sunrise" -s "$sunset" &
	fi
}

# Accepts managing parameter
case "${1:-}" in
'off')
	pkill wlsunset
	;;
'on')
	start
	;;
'toggle')
	if pkill -0 wlsunset 2>/dev/null; then
		pkill wlsunset
	else
		start
	fi
	;;
'check')
	command -v wlsunset &>/dev/null
	exit $?
	;;
esac

# Returns a string for Waybar
if pkill -0 wlsunset 2>/dev/null; then
	class="on"
else
	class="off"
fi

printf '{"alt":"%s"}\n' "$class"
