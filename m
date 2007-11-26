From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [patch 2/2] backport of sba sg list management
	to ccio-dma
Date: Sun, 25 Nov 2007 20:26:52 -0700
Message-ID: <20071126032652.GB11557@colo.lackof.org>
References: <JQIT2V$FB9C8381616CCA32E9FC6CC809E8D81D@scarlet.be>
	<20071028064158.GB29233@colo.lackof.org>
	<4724A084.5090709@scarlet.be>
	<20071029053015.GA14763@colo.lackof.org>
	<47488B33.5040904@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: kyle <kyle@mcmartin.ca>,
 parisc-linux <parisc-linux@parisc-linux.org>
To: Joel Soete <soete.joel@scarlet.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <47488B33.5040904@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Nov 24, 2007 at 08:36:03PM +0000, Joel Soete wrote:
> Hello Grant, Kyle,
>
> I finaly find an interesting paper on this Runway bc:
> <http://www.hpl.hp.com/hpjournal/96feb/feb96a6.htm>

Yeah, I read that article around the time it was published.
I was fortunate to have worked with Todd Kjos in the same group.

> I read it but i don't yet understand it in deep but this detail:
> "The lower 12 bits of the address must be left alone because of the 4K-byte 
> page size defined by the architecture."
>
> make me think that the IOVP_SHIFT of this ccio-dma driver would be always 
> 12 what ever could be the PAGE_SHIFT

The 12-bits per page (4k pages) is hard wired for the PA1.1 machines. 

> (it's not yet possible but for pa8000 and later it could be greater)?

Right. PA2.0 machines can support variable page sizes and parisc-linux
has "almost working" support bigger page sizes.

> That said for the moment IOVP_SHIF == PAGE_SHIFT so couldn't be the reason 
> of the followings issues.

Right, there might be other caching issues still though.

> On my d380, I reach to re-iterate some stress test on scsi ncr53c720 and 
> LASI 53c700 with a simple read/write loop like:
> # while true ; do nice -n -3 tar -xspf linux-2.6.11-rc3-pa3.tar ; nice -n 
> -3 rm -rf linux-2.6.11-rc3-pa3 ; date ; done

Sorry...same questions again:
	SMP or UP kernel?
	Which kernel version?


> With a fs build on a disk connected to a 53c710 hba, with or without my bp 
> patch, unfortunately I always got same errors after some loop's occurence:
> scsi3: (3:0) phase mismatch at 01e8, phase IO CD MSG BSY REQ MSG IN
>  scsi3: Bus Reset detected, executing command 10a304e0, slot 10a0864c, dsp 
> 001681e8[01e8]
>   failing command because of reset, slot 10a08520, cmnd 10a30720
...
> [snip]
>
> (this same disk connected to same lasi 53c710 of a b180 i.e. without 
> ccio-dma could loop severall days without showing any issue)

B180 is using uncached memory for it's control data and this has a
very different CPU timing. It's hard to say if the problem is a
memory ordering issue in zalon support or a bug in ccio driver.

sorry, can't be more precise than that.

cheers,
grant

> datazone - block = 1714387061, count = 1
> [snip]
>
> With the original ccio-dma driver it occures after few occurence of the 
> loop (about 5) but my patch only delay the pb to several houres (not 
> useless work but not yet enough).
>
> Any way fs is corrupted and this bring me to next major issue with my c110 
> (using same ncr53c720, lasi 53c710 and ccio-dma drivers as d380). This box 
> was sleeping till about a year, so I removed additional ram kit of 512Mb 
> for another usage and restored original ram of 64Mb, but internal boot disk 
> stay unchanged connected to the ncr53c720 hba.
> When I tried to reboot it some weeks ago with an existing & known working 
> kernels (from the time system still own 512Mb; e.g. 2.6.8.1-pa7, 
> 2.6.14-pa0, 2.6.19), it started to make a fsck obviously but this always 
> sadely (fsck generating a fs corrution, well not directly but by border 
> effect) ended by fs corruption too. That's only with the very old debian 
> install kernel 2.4.17-32 that I reach to reboot this system to install 
> latest 2.6.23-pa.orig and 2.6.23-pa+patch kernels. I could also reach to 
> reboot this box with latest mentioned kernels but as soon as I launched an 
> 'apt-get dist-upgrade' (after a update obviously) fs corruption occured 
> again. I was inocently expecting that after some reboot, fsck and renew 
> dist-upgrade, I would finaly recover a system operational like my d380. But 
> I was wrong and after 2 or 3 reboot this box became not-bootable anymore 
> (having lost too much critical files on the root fs :_().
>
> [Sade sade sade to me: in 10 years of linux, it's the very first time I 
> lost a system because of sw issue :__(]
>
> All this story to say in summary, a d380 with 256Mb of ram works more or 
> less fine (if I don't stress scsi disk) but a c110 with few 64Mb is not 
> usable at all (with either original or patched 2.6.23-pa kernels)?
>
> I have the filing that some cache coherency (I/O, mem??) lakes somewhere 
> but I didn't understand where/what is the code that do it now, so if you 
> have some more time to pin point it to me, I would greatly appreciate.
>
> TIA,
> 	J.
>
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
