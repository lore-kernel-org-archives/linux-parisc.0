From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: Bug#353480: yaird: [hppa] /dev/sd* device nodes not created and eth0 not enabled
Date: Sat, 18 Feb 2006 17:49:16 -0500
Message-ID: <20060218224916.GT13492__30721.5146408$1416624009$gmane$org@quicksilver.road.mcmartin.ca>
References: <20060218210228.2433.50230.reportbug@treebeard.fjphome.nl>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: Frans Pop <aragorn@tiscali.nl>,
 353480@bugs.debian.org
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <20060218210228.2433.50230.reportbug@treebeard.fjphome.nl>
Resent-Message-ID: <BVHAw.A.D5.im69DB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

On Sat, Feb 18, 2006 at 10:02:28PM +0100, Frans Pop wrote:
> udevd[862]: get_netlink_msg: unable to receive kernel netlink message: No buffer space available
> <!-- not sure about this message, but the same is shown for initramfs-tools --

This is the reason you aren't getting /dev/sd* nodes. I debugged
this yesterday, needs new udev upload, more details here:
http://marc.theaimsgroup.com/?l=linux-hotplug-devel&m=114019842906313&w=2


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
