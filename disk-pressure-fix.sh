# Find the node which has the disk pressure
oc get nodes <node> 

# SSH into that node
ssh <os-user>@<node>

# Disk cleanup
namespace default

# Check number of gb that will be removed
find /registry -mtime +7 -exec ls -s \; | awk '{sum+=$1;} END {print sum/1000;}'

# Removed based on image datetime
find /registry -mtime +7 -exec rm -fR {} \;
