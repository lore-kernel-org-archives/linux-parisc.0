From: Thibaut VARENE <varenet@parisc-linux.org>
Subject: Re: [parisc-linux] "find" bug, kernel 2.6.8.1-pa11?
Date: Sat, 16 Oct 2004 00:09:01 +0200
Message-ID: <20041016000901.747d1988@Tatooine.r3z0>
References: <30C87152-1EA4-11D9-B246-0030656F07A2@parisc-linux.org>
	<200410152224.40458.deller@gmx.de>
	<20041015233757.00988d93@Tatooine.r3z0>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <varenet@parisc-linux.org>
In-Reply-To: <20041015233757.00988d93@Tatooine.r3z0>
List-ID: <linux-parisc.vger.kernel.org>

Replying to myself since i have news:

I changed the nfs mount option to switch back from tcp to udp, and got rid
of the "value too loarge" messages, but:

JukeBox:/home/varenet# find /exports/ > /tmp/test
find: memory exhausted
JukeBox:/home/varenet# wc -l /tmp/test 
570 /tmp/test

So i can't really tell whether the "value too large" messages didn't show
because i switched to udp, or because not enough file where parsed. I'd go
for the latter, tho.

Unfortunately i can't mount the HD containing that much data on a PALinux
box, to tell whether that bug is network related (which seems likely to
me), or if that's something else.

HTH anyway

T-Bone

On Fri, 15 Oct 2004 23:37:57+0200 Thibaut VARENE
<varenet@parisc-linux.org> wrote:

> I should have mentionned this already, but the box is regularly updated,
> and the bugreport was sent after a fresh dist-upgrade. Nonetheless, this
> is a bug that has been affecting me for quite some time ("value too
> large for defined data type"), but the "memory exhausted" sounds new to
> me.
> 
> This is a cron job, so i wasn't paying much attention, until i noticed
> that things were actually getting worse...
> 
> HTH,
> 
> T-Bone
> 
> On Fri, 15 Oct 2004 22:24:40 +0200
> Helge Deller <deller@gmx.de> wrote:
> 
> > Hi Thibaut,
> > 
> > in case you did not apt-get updated' your machine to latest stuff,
> > please do so. I saw a lot of those errors with old userspace-binaries
> > as well (e.g. even after login with ssh, or while using "screen").
> > Updating fixed everything.
> > 
> > Just an idea...
> > 
> > Helge
> > 
> > 
> > On Friday 15 October 2004 14:17, Thibaut VARENE wrote:
> > > Hi,
> > > 
> > > Do we have some kind of bug here? See:
> > > 
> > > /exports contains several NFS mountpoints:
> > > 
> > > [varenet@JukeBox /exports]$ mount | grep nfs
> > > npyu:/Volumes/Atom/racine on /exports/npyu type nfs  
> > > (ro,noexec,soft,nolock,rsize=8192,wsize=8192,tcp,addr=147.215.7.13)
> > > neko:/home/ftp/mp3_1 on /exports/neko/mp3-1 type nfs  
> > > (ro,noexec,soft,nolock,rsize=8192,wsize=8192,addr=147.215.80.181)
> > > 
> > > Now see what happens:
> > > 
> > > [varenet@JukeBox /exports]$ find . > /home/varenet/playlistnow
> > > find: ./npyu/boxon/caprice/Metal/Royal Hunt - The watchers: Value
> > > too large for defined data type
> > > find: ./npyu/boxon/clubpc/Ziq/A5  
> > > (Darmstadt)/Warmduscher_Vs_Overdog_-_Live_at_A5_(Darmstadt)-DAB-12-
> > > 30 -2003-OMA: Value too large for defined data type
> > > find: ./npyu/boxon/done/Keeper Of The Seven Keys II: Value too large
> > >  
> > > for defined data type
> > > find: ./npyu/boxon/done/ROLLING STONES - Albumes 1964-1971 - CD1 de 
> > > BaTMaN/THE ROLLING STONES - 1965 - December's Children: Value too
> > > large  for defined data type
> > > find: ./npyu/boxon/samy/Vrac/pop: Value too large for defined data
> > > type find: ./npyu/boxon/samy/Walt Disney Phil Collins: Value too
> > > large for  defined data type
> > > find: ./npyu/boxon/samy/albums/ALADDIN: Value too large for defined 
> > > data type
> > > find: ./npyu/boxon/samy/albums/jah/THE selection: Value too large
> > > for defined data type
> > > find: ./npyu/boxon/samy/squarepusher: Value too large for defined
> > > data
> > >  
> > > type
> > > find: ./npyu/iTunes/Benny Benassi/Hypnotica: Value too large for  
> > > defined data type
> > > find: memory exhausted
> > > 
> > > [varenet@JukeBox /exports]$ wc -l /home/varenet/playlistnow
> > > 14023 /home/varenet/playlistnow
> > > 
> > > [varenet@JukeBox /exports]$ uname -a
> > > Linux JukeBox 2.6.8.1-pa11 #1 Sat Sep 11 19:54:13 CEST 2004 parisc  
> > > GNU/Linux
> > > 
> > > Top showed that find ate all available memory before being killed:
> > > 22499 varenet   25   0  257m 243m 1584 R 65.4 64.6   2:12.61 find
> > > 
> > > That box has 492MB RAM, it's a B132L+, running sarge.
> > > 
> > > /exports has more than 60000 files, representing about 200GB of
> > > data.
> > > 
> > > running find on one of the origin folders (the biggest actually) on
> > > the  NFS server host shows:
> > > 
> > > [varenet@npyu /Volumes/Atom]$ find racine/ | wc -l
> > >     48867
> > > 
> > > (npyu is an OSX box, fwiw).
> > > 
> > > HTH,
> > > 
Thibaut VARENE
The PA/Linux ESIEE Team
http://www.pateam.org/
