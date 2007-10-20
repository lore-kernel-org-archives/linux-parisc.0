From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] what's in parisc-2.6.git
Date: Sat, 20 Oct 2007 13:24:36 -0400 (EDT)
Message-ID: <200710201724.l9KHOawa021786__48143.154444597$1416624447$gmane$org@hiauly1.hia.nrc.ca>
References: <200710200214.l9K2Ex5X001494@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: kyle@mcmartin.ca,
 parisc-linux@lists.parisc-linux.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200710200214.l9K2Ex5X001494@hiauly1.hia.nrc.ca> from "John David
	Anglin" at Oct 19, 2007 10:14:59 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Ok, I saw you made a lot of updates to parisc-2.6, so I cloned it
> this evening.

This kernel build also has the user/group problem:

...
Starting internet superserver: inetd.
Starting Postfix Mail Transport Agent: postfixpostfix: fatal: file /etc/postfix/main.cf: parameter default_privs: unknown user name value: nobody
 failed!
...

This is without udev installed.  With udev, the problems are much
more serious:

...
Mount failed for selinuxfs on /selinux:  No such file or directory
INIT: version 2.86 booting
udevd[298]: init_udevd_socket: bind failed: Address already in use
udevd[297]: init_udevd_socket: bind failed: Address already in use
udevd[297]: main: error initializing udevd socket
udevd[296]: main: error disabling OOM: No such file or directory
udevd[299]: init_udevd_socket: bind failed: Address already in use
udevd[299]: main: error initializing udevd socket
* .udev/ already exists on the static /dev!
Starting the hotplug events dispatcher: udevdudevd[379]: init_udevd_socket: bind failed: Address already in use
error initializing udevd socket
udevd[379]: main: error initializing udevd socket
 failed!
Setting the system clock.
Cannot access the Hardware Clock via any known method.
Use the --debug option to see the details of our search for an access method.
* Unable to set System Clock to: Sat Oct 20 06:10:23 UTC 2007
Activating swap:.
Will now check root file system:fsck 1.40.2 (12-Jul-2007)
[/sbin/fsck.ext2 (1) -- /lib/init/rw/rootdev] fsck.ext2 -a -C0 /lib/init/rw/rootdev
/lib/init/rw/rootdev: clean, 594499/4308992 files, 2720805/8612848 blocks.
Setting the system clock.
Cannot access the Hardware Clock via any known method.
Use the --debug option to see the details of our search for an access method.
* Unable to set System Clock to: Sat Oct 20 06:10:25 UTC 2007
Cleaning up ifupdown....
Loading kernel module tg3.
tg3.c:v3.84 (October 12, 2007)
eth0: Tigon3 [partno(BCM95700A6) rev 0105 PHY(5701)] (PCI:66MHz:64-bit) 10/100/1000Base-T Ethernet 00:30:6e:4b:16:4d
eth0: RXcsums[1] LinkChgREG[0] MIirq[0] ASF[0] WireSpeed[1] TSOcap[0]
eth0: dma_rwctrl[76ff2d0f] dma_mask[32-bit]
Loading device-mapper support.
Loading device-mapper support.
Will now check all file systems.
fsck 1.40.2 (12-Jul-2007)
Checking all file systems.
[/sbin/fsck.ext2 (1) -- /boot] fsck.ext2 -a -C0 /dev/sda1
fsck.ext2: No such file or directory while trying to open /dev/sda1
/dev/sda1:
The superblock could not be read or does not describe a correct ext2
filesystem.  If the device is valid and it really contains an ext2
filesystem (and not swap or ufs or something else), then the superblock
is corrupt, and you might try running e2fsck with an alternate superblock:
    e2fsck -b 8193 <device>

fsck died with exit status 8
* File system check failed.
A log is being saved in /var/log/fsck/checkfs if that location is writable.
Please repair the file system manually.
* A maintenance shell will now be started.
CONTROL-D will terminate this shell and resume system boot.
Give root password for maintenance
(or type Control-D to continue):
...

Possibly, this caused by setting

  CONFIG_UEVENT_HELPER_PATH="/sbin/udevd"

"/sbin/hotplug" doesn't exist and there's no help for this option,
so it's not obvious what to select.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
