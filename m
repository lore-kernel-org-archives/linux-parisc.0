Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlas.valhalla.net (atlas.valhalla.net [195.26.32.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6CCAB482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 11 Jan 2002 15:03:27 -0700 (MST)
Message-ID: <001401c19aea$c3282f60$503b9ed4@brianmoc>
From: "Brian Mockford" <brian.mockford@dartnet.co.uk>
To: "Phil Anderson" <andersop@neverland.ncssm.edu>,
	"Matt Taggart" <taggart@carmen.fc.hp.com>
Cc: "Sorin Ghinescu" <sghinesc@columbus.rr.com>,
	<parisc-linux@lists.parisc-linux.org>
References: <Pine.LNX.4.33.0201102123200.22257-100000@bob.ncssm.edu>
Subject: Re: [parisc-linux] 712/80 - 7cdroms - scsi prbl 
Date: Fri, 11 Jan 2002 21:55:54 -0000
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Perhaps ---

This is a classic symptom of a SCSI device set with the same address as the
SCSI controller - normally 7 in a narrow SCSI environment.
Change the address of the CDROM to 4
You need to identify the CDROM SCSI address jumpers. (usually 3 pairs of
adjacent pins with plastic shorting jumpers on. If all three have jumpers
then it is likely the device is set to address 7. remove the middle jumper -
this will change it to address 4. There may still be a conflict with another
device , but the seven drives should "go away"

Regards

Brian Mockford.
----- Original Message -----
From: "Phil Anderson" <andersop@neverland.ncssm.edu>
To: "Matt Taggart" <taggart@carmen.fc.hp.com>
Cc: "Sorin Ghinescu" <sghinesc@columbus.rr.com>;
<parisc-linux@lists.parisc-linux.org>
Sent: Friday, January 11, 2002 2:24 AM
Subject: Re: [parisc-linux] 712/80 - 7cdroms - scsi prbl


>
>
> I've had this happen too, but it was on a Sun Ultra 30. The problem was
> that the computer didn't recognize the CDROM correctly. Trying a different
> cdrom may fix the problem... It did for me.
>
> -phil
>
>
>
>
> On Thu, 10 Jan 2002, Matt Taggart wrote:
>
> >
> > "Sorin Ghinescu" writes...
> >
> > > Hi guys,
> > > I'm trying to install parisc-linux on 712/80.
> > > I don't know if this is actually an OS problem or a hardware problem
but
> > > you may have experienced it and could help me.
> > > I'm booting from my external cd-rom but it seems that the kernel is
> > > fooled by something because it creates 7 cd-rom devices for all the
scsi
> > > targets available leaving no room for the hd. If I switch the cd-rom
off
> > > then I get 7 hds!
> > > Has anyone experienced this?
> >
> > Check and make sure that none of your scsi ids are conflicting, don't
> > forget the controller is at id 7. Also check your cables and
termination.
> > If it still doesn't work try a different hard drive.
> >
> >
>
> --
>
============================================================================
===
>
> Phil Anderson
> UNIX Systems Administrator
> andersop@neverland.ncssm.edu
> The_13th_Ewok@hotmail.com
>
> "Go CRAZY? Don't mind if I do! Woowoowoowoo!" -Homer Simpson
>
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
