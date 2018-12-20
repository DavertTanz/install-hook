#!/usr/bin/env bash

URL_TO_HOOK="https://raw.githubusercontent.com/Davert94/prepare-commit-msg/master/prepare-commit-msg"

DESTINATION_FILE=.git/hooks/prepare-commit-msg
RESERVE_FILE="${DESTINATION_FILE}.reserve"

# Сохраним старый хук на всякий
mv "${DESTINATION_FILE}" "${RESERVE_FILE}" 2>/dev/null

wget "${URL_TO_HOOK}" -O "${DESTINATION_FILE}"
WGET_RESULT=$?

if [[ ${WGET_RESULT} -eq 0 ]];
then
	chmod +x "${DESTINATION_FILE}"

	echo -e "\nHook \"${DESTINATION_FILE}\" successfully installed!"
else
	mv "${RESERVE_FILE}" "${DESTINATION_FILE}" 2>/dev/null

	echo -e '\nERROR: installable file not found.\nPlease, write about it on email: davert-tanz@yandex.ru'
fi
