# Shell script to install prshabboszman locally
# Run with root priveliges
# Run inside prshabboszman directory
#! /bin/sh
mv ../prshabboszman /usr/local/lib/prshabboszman				# Move directory containing git repository to /usr/local/lib/
chown -R root:root /usr/local/lib/prshabboszman					# Change owner to root and group to root
chmod -R a+rx /usr/local/lib/prshabbsozman					# Add read and execute permissions for all users
ln -s /usr/local/lib/prshabboszman/prshabboszman.sh /usr/local/bin/psz		# Create symbolic link to prshabboszman.sh in /usr/local/bin/ called psz
