From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: Installing on RP5430...PALO problem
Date: Sat, 22 May 2004 19:10:27 -0600
Message-ID: <20040523011027.GA16879@colo.lackof.org>
References: <20040520132751.GA23823@colo.lackof.org>
	<20040521083816.ECD1F38863@mailserver.photonicmaterials.com>
	<20040521134552.GA13478@colo.lackof.org>
	<40AE41F1.3050400@tiscali.be>
	<20040522025819.GB25166@colo.lackof.org>
	<40AFBE60.7030306@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <joel.soete@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <40AFBE60.7030306@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, May 22, 2004 at 08:56:00PM +0000, Joel Soete wrote:
> Yep, sorry just a bit lazy but I was very surprise by this advise?

np. thanks.

> >>imho if you don't have hw raid array (no clue about hp2100 sorry) why 
> >>not building a sw raid5 for an economical and robust disk array (with 
> >>severall scsi controler it is even possible to play with striping: raid0 
> >>iirc) which you include in a vg that you can easily manage with 
> >>different lv?
> >
> >mdadm will allow one to build raid0/1/3/5 also.
> > 
> >
> yes but my question was in fact about lvm above sw raid array: I don't 
> have any more the opportunity to test it?

You are welcome to use LVM. People I trust tell me not to use it.
And my experience with HPUX LVM has left a bad taste.

Is there something you want to do with LVM that can't be
done with MD devices? (and using mdadm to manage them)
I'm just curious since mdadm seems to work nicely.

> (the only one I had some time ago was an old fc scsi disk array with the 
> n4k and its hp tachion fc interface but you know the pb I encounter ;)

yes - I vaguely remember. I depend on the mailing list
archive to "remember" deails though.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
