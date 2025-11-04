## SSH Failed to Ec2-Instance Due to Wrong Permissions.

### Recover the instance by attaching its disk to another EC2 instance and fixing permissions.

### Steps:-

1. **Stop the Compromised Instance**: Stop the EC2 instance that has the permission issues. Do not terminate it.
2. **Detach the Root Volume**: Detach the root EBS volume from the stopped instance. Note the device name (e.g., /dev/xvda).
3. **Launch a Temporary Instance**: Launch a new, temporary EC2 instance in the same Availability Zone as the compromised instance's volume. This instance will be used to access and repair the detached volume.
4. **Attach the Detached Volume to the Temporary Instance:** Attach the EBS volume from the compromised instance to the temporary instance as a data volume (e.g., /dev/sdf).
5. **Connect to the Temporary Instance and Mount the Volume:**
  - SSH into the temporary instance.
  - Create a mount point.
    ```bash
    sudo mkdir rescue
    ```
  - Mount the detached volume.
  - If a duplicate UUID error occurs, use the nouuid option:
    ```bash
    sudo -o nouuid volume-name path-to-mount
    ```
    Example:-
    ```bash
    sudo -o nouuid /dev/xvda1 /rescue
    ```
  - Fix Permissions:  Navigate to the mounted volume's root:
    ```bash
    cd rescue
    ```
  - Determine the correct permissions for the ec2-user directory and any other affected files/directories. For the ec2-user home directory, typical permissions are 700 for the directory itself and potentially 600 for the authorized_keys file within .ssh.
   ```bash
    sudo chmod 700 home/ec2-user
    sudo chmod 600 home/ec2-user/.ssh/authorized_keys
   ```
  - Apply the correct permissions:
  - unmount the volume.
    ```bash
    sudo umount rescue
    ```
6. **Detach the Volume from the Temporary Instance:** Detach the volume from the temporary instance through the EC2 console.
7. **Reattach the Volume to the Original Instance:** Reattach the volume to the original, compromised instance as its root volume (e.g. /dev/xvda).
8. **Start the Original Instance:** Start the original EC2 instance.
9. **Verify Access:** Attempt to SSH into the recovered instance to confirm that the permissions are now correct and access is restored.
10. **Terminate the Temporary Instance (Optional):** If the recovery is successful, you can terminate the temporary instance to avoid unnecessary costs. 


