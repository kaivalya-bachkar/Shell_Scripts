# Configure network card bonding or teaming in local Linux (combine 2 NICs for redundancy or speed).

## Network bonding is a process of combing or joining two or more network interfaces together into a single interface.

Steps:-
### Adding the Second NIC in VirtualBox:
1. **Power Off the Virtual Machine:** Ensure the CentOS virtual machine is completely shut down, not just suspended.
2. **Access Settings:** Open VirtualBox, right-click on your CentOS VM, and select "Settings."
3. **Navigate to Network:** In the settings window, click on "Network."
4. **Enable Adapter 2:** Click on the "Adapter 2" tab. Check the "Enable Network Adapter" box.
5. **Choose Attachment Type:** Select the "Attached to" option based on your requirements:
   - **NAT:** Provides internet access to the VM but isolates it from other VMs on the same host-only network.
   - **Bridged Adapter:** Connects the VM directly to your physical network, allowing it to act like a separate physical machine on your network.
   - **Host-only Adapter:** Creates a private network between the host machine and the VM, useful for local testing and communication without external network access.
   - **Internal Network:** Creates a private network solely between VirtualBox VMs, isolating them from the host and external networks
6. **Configure MAC Address (Optional):** You can note down the MAC address displayed for Adapter 2 under the "Advanced" section if you need to manually configure it later in CentOS.
7. **Apply Changes:** Click "OK" to save the network adapter settings. 

### Configuring the New Network Interface in CentOS 

1. **Start the Virtual Machine:** Boot up your CentOS virtual machine:
2. **Identify the New Interface:**
  - Log in to your CentOS system.
  - Open a terminal and run ip a or ifconfig (if net-tools is installed) to identify the newly added network interface. It will likely appear as enp0sX or ethX (e.g., enp0s8, eth1).
3. **Create/Modify Network Configuration File:**
  - Navigate to the network-scripts directory:
  ```bash
  cd /etc/sysconfig/network-scripts/ 
  ```
  - **If the file doesn't exist:** Create a new configuration file for the new interface. For example, if your new interface is enp0s8, create ifcfg-enp0s8. You can copy an existing configuration file as a template
  ```bash
  sudo cp ifcfg-enp0s3 ifcfg-enp0s8
  ```
4. **Edit the new configuration file:** Open the new file (e.g., ifcfg-enp0s8) with a text editor like vi or nano:
  ```bash
  sudo nano ifcfg-enp0s8
  ```
5. **Modify the following lines:**
  - DEVICE=enp0s8 (Replace enp0s8 with your actual interface name)
  - NAME=enp0s8 (Replace enp0s8 with your actual interface name)
  - BOOTPROTO=static or BOOTPROTO=dhcp (Choose static for a fixed IP address or dhcp to obtain an IP automatically).
  - If BOOTPROTO=static: Add or modify the following lines with your desired IP address, netmask, and gateway:
      IPADDR=192.168.1.100
      NETMASK=255.255.255.0
      GATEWAY=192.168.1.1
      ONBOOT=yes (Ensures the interface starts on boot).
6. **Remove or update UUID and HWADDR:** If you copied an existing file, remove the UUID line and update the HWADDR line with the MAC address of your new adapter (obtained from VirtualBox settings) if necessary.
  - Restart Network Service.
    ```bash
    sudo systemctl restart network
    ```
7. Verify Configuration:
   - Run ip a or ifconfig again to confirm that the new interface is up and has the correct IP address.
   - Test connectivity by pinging another machine on the same network or an external address if configured for internet access.

## Creating a NIC bond in CentOS 9 can be achieved using the nmtui utility (NetworkManager Text User Interface) or the nmcli command-line tool. Both methods configure NetworkManager to manage the bonded interface.



 
