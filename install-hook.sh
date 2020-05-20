#!/usr/bin/env bash

URL_TO_HOOK="https://raw.githubusercontent.com/Davert94/prepare-commit-msg/master/prepare-commit-msg"

DESTINATION_FILE=.git/hooks/prepare-commit-msg
RESERVE_FILE="${DESTINATION_FILE}.reserve"

HTTP_CLIENT=$(which wget 2>/dev/null)
IS_CURL=0

if [[ -z ${HTTP_CLIENT} ]];
then
    IS_CURL=1
fi

# Сохраним старый хук на всякий
mv "${DESTINATION_FILE}" "${RESERVE_FILE}" 2>/dev/null

if [[ ${IS_CURL} -eq 1 ]];
then
    curl -s "${URL_TO_HOOK}" -o "${DESTINATION_FILE}"
else
    wget -q "${URL_TO_HOOK}" -O "${DESTINATION_FILE}"
fi

REQUEST_RESULT=$?

if [[ ${REQUEST_RESULT} -eq 0 ]];
then
    chmod +x "${DESTINATION_FILE}"

    echo -e "Hook \"${DESTINATION_FILE}\" successfully installed!"
else
    mv "${RESERVE_FILE}" "${DESTINATION_FILE}" 2>/dev/null

    echo -e 'ERROR: installable file not found.\nPlease, write about it on email: davert-tanz@yandex.ru'
fi
