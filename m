Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from spike2.ehosting.com (unknown [62.173.67.13])
	by dsl2.external.hp.com (Postfix) with SMTP id 993B74844
	for <parisc-linux@lists.parisc-linux.org>; Tue, 16 Sep 2003 13:01:45 -0600 (MDT)
Message-ID: <1063738987.3f675e6b22961@webmail.v8fiesta.co.uk>
Date: Tue, 16 Sep 2003 20:03:07 +0100
From: mmogenius@v8fiesta.co.uk
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] x86 on b2000
References: <Pine.LNX.4.44.0308280022230.16696-100000@sal.ucc.ie> <1062062541.3f4dc9cd843ed@webmail.v8fiesta.co.uk> <1063733943.3f674ab751edb@webmail.v8fiesta.co.uk> <20030916174726.GC30906@dsl2.external.hp.com>
In-Reply-To: <20030916174726.GC30906@dsl2.external.hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

I have tried this but i am still getting the same error message... 

Fatal server error:
AddScreen/ScreenInit Failed for driver 0 

With me having 2 cards in the machine do i need to specify wich one to use ?

if so where can i get the information to do this as i am not having much luck 
finding any documentation. Thanks



Quoting Grant Grundler <grundler@parisc-linux.org>:

> On Tue, Sep 16, 2003 at 06:39:03PM +0100, mmogenius@v8fiesta.co.uk wrote:
> > Ok thanks to everyone i now have the graphics card and it appears to work a
> 
> > little better as i now get a nice picture of a penguine in the top left
> > corner when i boot tha machine
> 
> that's good
> 
> > .... although i am not sure what type of card i should 
> > configure it as under X.... what other ways are there of configuring X
> other 
> > then xf86config as it's rather confusing. Thanks
> 
> Yes - edit /etc/X11/XF86Config-4 directly.
> You can grab one that works on C3000 with Vis-EG from
> 	ftp://ftp.parisc-linux.org/kernels/c3000
> 
> You will probably have to edit the resolution (eg 1280x1024)
> to match what you currently have enabled.
> 
> When powering up the computer, hit <TAB> to pick the highest
> resolution that works with your monitor/LCD. Then make sure
> those are the only values in you XFConfig86-4 file.
> 
> grant
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 




-------------------------------------------------
This mail sent through IMP: http://horde.org/imp/
