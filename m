Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from daedalus.cs.brandeis.edu (daedalus.cs.brandeis.edu [129.64.3.179])
	by dsl2.external.hp.com (Postfix) with ESMTP id C26C3482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 22 Jan 2002 16:55:33 -0700 (MST)
Received: (from aaronm@localhost)
	by daedalus.cs.brandeis.edu (8.9.3/8.9.3) id SAA29349
	for parisc-linux@lists.parisc-linux.org; Tue, 22 Jan 2002 18:55:30 -0500
Date: Tue, 22 Jan 2002 18:55:30 -0500
From: Aaron Macks <aaronm@cs.brandeis.edu>
To: PARISC-Linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Trouble installing 0.9.3 on 735/99
Message-ID: <20020122185530.A29342@daedalus.cs.brandeis.edu>
References: <20020122120548.M19637@systemhalted> <Pine.LNX.4.33.0201221352470.18962-100000@goliath.alaskatech.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0201221352470.18962-100000@goliath.alaskatech.org>; from palinux@alaskatech.org on Tue, Jan 22, 2002 at 01:55:57PM -0900
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

I've got stock 0.93 running on two 715/33's with:
COMPAQ C2247 (1gb scsi drives) and a seagate of recentish vintage(1gb
1/4 height from an SGI) in a 715/50
no problems
Aaron
On Tue, Jan 22, 2002 at 01:55:57PM -0900, Tom wrote:
> On Tue, 22 Jan 2002, Carlos O'Donell Jr. wrote:
> > I can't get any of the 715/50's to run stably with the newer
> > SCSI driver. And after testing I can almost pinpoint with 95%
> > accuracy tha it's the new driver.
> >
> > I have yet to go about running the latest kernel with the sim700
> > driver. Though if I get some time this afternoon I will.
> > (Just spent some time adding diskless 715/50's to our cluster)
> >
> > Has anyone been able to get SCSI disks that are not from HP
> > to work on the 715's? (New terminator? Different terminator?)
> 
> I had a 1G HP /dev/sda and a 4G Micropolis /dev/sdb in my 715/100. Didn't
> realize that HP actually expects you to terminate the unused ports on the
> back until I was provided a link to my users manual :-) I also had to set
> the drive's parity on, and enable the 'wait for start' command.
> 
> I also ran an IBM 4G DFHS-S4W drive on it initially. That was quite early
> on in the process, though, so I had lots of crashes etc. that I don't know
> were related to Debian/HPPA being 'alpha' software or due to the drive :-)
> 
> 
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

-- 
_______________________________________________________
Aaron Macks(aaronm@cs.brandeis.edu)
My sheep has seven gall bladders, that makes me the King of the Universe!
