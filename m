From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] "find" bug, kernel 2.6.8.1-pa11?
Date: Fri, 15 Oct 2004 22:24:40 +0200
Message-ID: <200410152224.40458.deller@gmx.de>
References: <30C87152-1EA4-11D9-B246-0030656F07A2@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: Thibaut VARENE <varenet@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <30C87152-1EA4-11D9-B246-0030656F07A2@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi Thibaut,

in case you did not apt-get updated' your machine to latest stuff, please do so.
I saw a lot of those errors with old userspace-binaries as well (e.g. even after login with ssh, or while using "screen"). 
Updating fixed everything.

Just an idea...

Helge


On Friday 15 October 2004 14:17, Thibaut VARENE wrote:
> Hi,
> 
> Do we have some kind of bug here? See:
> 
> /exports contains several NFS mountpoints:
> 
> [varenet@JukeBox /exports]$ mount | grep nfs
> npyu:/Volumes/Atom/racine on /exports/npyu type nfs  
> (ro,noexec,soft,nolock,rsize=8192,wsize=8192,tcp,addr=147.215.7.13)
> neko:/home/ftp/mp3_1 on /exports/neko/mp3-1 type nfs  
> (ro,noexec,soft,nolock,rsize=8192,wsize=8192,addr=147.215.80.181)
> 
> Now see what happens:
> 
> [varenet@JukeBox /exports]$ find . > /home/varenet/playlistnow
> find: ./npyu/boxon/caprice/Metal/Royal Hunt - The watchers: Value too  
> large for defined data type
> find: ./npyu/boxon/clubpc/Ziq/A5  
> (Darmstadt)/Warmduscher_Vs_Overdog_-_Live_at_A5_(Darmstadt)-DAB-12-30 
> -2003-OMA: Value too large for defined data type
> find: ./npyu/boxon/done/Keeper Of The Seven Keys II: Value too large  
> for defined data type
> find: ./npyu/boxon/done/ROLLING STONES - Albumes 1964-1971 - CD1 de  
> BaTMaN/THE ROLLING STONES - 1965 - December's Children: Value too large  
> for defined data type
> find: ./npyu/boxon/samy/Vrac/pop: Value too large for defined data type
> find: ./npyu/boxon/samy/Walt Disney Phil Collins: Value too large for  
> defined data type
> find: ./npyu/boxon/samy/albums/ALADDIN: Value too large for defined  
> data type
> find: ./npyu/boxon/samy/albums/jah/THE selection: Value too large for  
> defined data type
> find: ./npyu/boxon/samy/squarepusher: Value too large for defined data  
> type
> find: ./npyu/iTunes/Benny Benassi/Hypnotica: Value too large for  
> defined data type
> find: memory exhausted
> 
> [varenet@JukeBox /exports]$ wc -l /home/varenet/playlistnow
> 14023 /home/varenet/playlistnow
> 
> [varenet@JukeBox /exports]$ uname -a
> Linux JukeBox 2.6.8.1-pa11 #1 Sat Sep 11 19:54:13 CEST 2004 parisc  
> GNU/Linux
> 
> Top showed that find ate all available memory before being killed:
> 22499 varenet   25   0  257m 243m 1584 R 65.4 64.6   2:12.61 find
> 
> That box has 492MB RAM, it's a B132L+, running sarge.
> 
> /exports has more than 60000 files, representing about 200GB of data.
> 
> running find on one of the origin folders (the biggest actually) on the  
> NFS server host shows:
> 
> [varenet@npyu /Volumes/Atom]$ find racine/ | wc -l
>     48867
> 
> (npyu is an OSX box, fwiw).
> 
> HTH,
> 
> Thibaut VARENE
> The PA/Linux ESIEE Team
> http://www.pateam.org/
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
