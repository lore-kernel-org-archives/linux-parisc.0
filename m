From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: Trying to install sarge on a C200
Date: Tue, 11 Oct 2005 15:54:53 -0600
Message-ID: <20051011215453.GA13161__39465.227435767$1416623928$gmane$org@colo.lackof.org>
References: <434A195B.5010201@albacom.net> <20051010161557.GA15072@colo.lackof.org> <434BDE68.1070605@albacom.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
 debian-hppa@lists.debian.org,
 parisc-linux@lists.parisc-linux.org
To: Fabio Bizzi <bizzi@albacom.net>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <434BDE68.1070605@albacom.net>
Resent-Message-ID: <2LCYRC.A.h5F.WMDTDB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

On Tue, Oct 11, 2005 at 05:46:48PM +0200, Fabio Bizzi wrote:
> Yesterday night I've tried the following:
> 
> 1) Started installation form sarge netboot
> 2) Standard partitioning with a "/" partition fo about 35.5GB
> 3) Run installation till reboot question
> 
> Instead rebooting I've started a shell, unmounted "/target" and started 
> a fsck to check the root partition with this output:
> 
> 8<---8<---8<---8<---8<---8<---8<---8<---8<---8<---8<---8<---8<---8<---8<---
> 
> ~ # fsck.ext3 /dev/discs/disc0/part5 -f
> e2fsck 1.37 (21-Mar-2005)
> Pass 1: Checking inodes, blocks, and sizes
> Inode 1311742 has illegal block(s).  Clear<y>? yes
> 
> Illegal block #12 (3271557120) in inode 1311742.  CLEARED.
> Illegal block #13 (637534208) in inode 1311742.  CLEARED.
...

Ok. Definitely problems with this. Something wrong with high inode counts.
Can someone map where those inodes live on the disk?
Ie which block number would they reside on (about)?

> So, I think that sarge netinst kernel probably has a bug for partition 
> bigger than 18GB. :(

Maybe...does using two partitions solve avoid those issues?

> Do you think I'd do:
> 
> 1) Tring an installation from "etch" netinst CD
> or
> 2) Continue with sarge netinst and use two 18GB partition

Your choice. two 18GB partions should work fine too.
My preference would be to try the "etch" netinst CD but I don't
have a clue if that works better or not for C200.

> Please let me know because at home I have no fast internet connection 
> and if I'd try the sarge option I'll download at office the installation 
> CD and the packages DVD.
> 
> Thanks a lot to everybody! :)

welcome - and thanks for your patience and tenacity.

ciao!
grant


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
