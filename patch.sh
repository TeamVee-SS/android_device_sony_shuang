#!/bin/bash
# Writen by Caio Oliveira aka Caio99BR <caiooliveirafarias0@gmail.com>

fix_rejects() {
gedit $(find . -name *rej | rev | cut -c 5- | rev | tr '\n' ',' | sed 's/,/* /g') &
}

clean_rejects() {
rm -rf $(find . -name *rej)
}

cleanup_git() {
git reset --hard HEAD
git am --abort
}

if [ ! "${BASH_VERSION}" ]
then
	echo "  | Please just use '. patch.sh'"
elif [ "$(ls .git/ | wc -l)" == "0" ]
then
	echo "  | Please use with GIT"
elif [ -e patch.sh ]
then
	echo "  | Live Git Tools"
	echo "  |"
	echo "  | Usage:"
	echo "  |  . patch.sh [LINK] [-r] [-c] [-C]"
	echo "  |"
	echo "  | LINK: link to github commit"
	echo "  | -r: Open gedit with original/reject files"
	echo "  | -c: Delete all reject files"
	echo "  | -C: Delete all reject files, and cleanup GIT"
	PATCH_COUNT="0"
	for PATCH_LINK in ${@}
	do
		if [ ${PATCH_LINK} == "-r" ]
		then
			fix_rejects
		elif [ ${PATCH_LINK} == "-c" ]
		then
			clean_rejects
		elif [ ${PATCH_LINK} == "-C" ]
		then
			clean_rejects
			cleanup_git
		else
			echo "  |"
			echo "  | Number of patch's: ${#}"
			PATCH_COUNT=$[${PATCH_COUNT} + 1]

			echo "  |"
			echo "  | Patch #${PATCH_COUNT}"
			if ! [ "$(echo ${PATCH_LINK} | grep -o .patch)" == ".patch" ]
			then
				PATCH_LINK="${PATCH_LINK}.patch"
			fi
			PATCH_PATH="/tmp/patch.sh-${PATCH_COUNT}.patch"

			echo "  |"
			echo "  | Downloading"
			curl -# -o ${PATCH_PATH} ${PATCH_LINK}
			if [ -f "${PATCH_PATH}" ]
			then
				echo "  |"
				echo "  | Patching"
				git am -3 ${PATCH_PATH}
				if [ "${?}" == "0" ]
				then
					echo "  |"
					echo "  | Patch (${PATCH_COUNT}/${#})"
				else
					echo "  |"
					echo "  | Something not worked good in patch #${PATCH_COUNT}"
					echo "  |"
					echo "  | You will need to fix manually"
					echo "  | Use it \$(curl ${PATCH_LINK} | git am -3; curl ${PATCH_LINK} | git apply --reject; . patch.sh -r)"
					echo "  |"
					echo "  | Anyway, aborting current 'git am' process"
					git am --abort
					if ! [ "${PATCH_COUNT}" == "${#}" ]
					then
						if [ ${#} -gt "1" ]
						then
							echo "  |"
							echo "  | Passing to next patch"
						fi
					fi
				fi
			else
				echo "  |"
				echo "  | Patch not downloaded, check internet or link"
				if ! [ "${PATCH_COUNT}" == "${#}" ]
				then
					if [ ${#} -gt "1" ]
					then
						echo "  |"
						echo "  | Passing to next patch"
					fi
				fi
			fi
			rm -rf ${PATCH_PATH}
		fi
	done
else
	echo
	echo "  | Ensure you run this file from the SAME folder of .git"
	echo "  | otherwise the script will fail hard"
	echo "  | After you 'cd' to the correct folder, start the build script"
	echo "  | with the . patch.sh command, NOT with any other command!"
	echo
fi
