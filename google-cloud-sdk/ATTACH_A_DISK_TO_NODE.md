# Attach a disk to a node 
```shell script
lsblk  # find nay available disk  i.e /dev/sdb 
sudo mkfs.ext4 -m 0 -E lazy_itable_init=0,lazy_journal_init=0,discard /dev/sdb # format the disk in ext4
mkdir -p /mnt/disks/data   # set a mount point as directory in /mnt/disk
sudo mount -o discard,defaults /dev/sdb /mnt/disks/data # mount the new disk 
```