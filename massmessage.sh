#!/bin/bash

# Token bot Telegram Anda
TOKEN="masukkan_token_bot_anda"

# Daftar chat ID yang akan menerima pesan massal
chat_ids=("chat_id_1" "chat_id_2" "chat_id_3")  # Ganti dengan chat ID yang valid

# Pesan yang akan dikirimkan
pesan="Halo! Ini adalah pesan massal."

# Fungsi untuk mengirim pesan ke chat ID tertentu
function kirim_pesan() {
    local chat_id=$1
    curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" \
        -d "chat_id=$chat_id" \
        -d "text=$pesan" \
        -o /dev/null
    echo "Pesan terkirim ke chat ID: $chat_id"
}

# Loop untuk mengirim pesan ke setiap chat ID dengan penundaan 5 detik
for chat_id in "${chat_ids[@]}"
do
    kirim_pesan "$chat_id"
    sleep 5
done
