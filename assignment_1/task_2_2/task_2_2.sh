cuboid_volume() {
	local h=$1
	local w=$2
	local l=$3
	local v=$(( h * w * h  ))
	echo $v  
}

cuboid_volume 3 2 3
