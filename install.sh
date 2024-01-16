# Shell script to install prytzman locally
# Run with root priveliges
# Run inside prytzman directory
#! /bin/sh
mv ../prytzman /usr/local/lib/prytzman					# Move directory containing git repository to /usr/local/lib/
chown -R root:wheel /usr/local/lib/prytzman				# Change owner to root and group to wheel
chmod -R a+rx /usr/local/lib/prytzman					# Add read and execute permissions for all users
chmod -R g+w /usr/local/lib/prytzman					# Add write permissions for members of the wheel group
ln -s /usr/local/lib/prytzman/prytzman.sh /usr/local/bin/psz		# Create symbolic link to prytzman.sh in /usr/local/bin/ called psz
