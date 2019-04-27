#!/bin/bash
vpn(){
    sudo openvpn --config /etc/openvpn/client/$1
}
complete -W "$(ls /etc/openvpn/client/)" vpn
alias wifi_device_view_status="ip link show wlp3s0"
alias wifi_device_enable="ip link set wlp3s0 up"
alias wifi_iw_status="iw dev wlp3s0 link"
alias enable_dhcpcd="systemctl status dhcpcd"
