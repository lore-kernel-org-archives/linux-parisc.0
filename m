Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id C74B6487B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 16 Jul 2002 01:29:13 -0600 (MDT)
Message-ID: <3D33CB48.6050208@esiee.fr>
Date: Tue, 16 Jul 2002 09:29:12 +0200
From: Matthieu Delahaye <delahaym@esiee.fr>
MIME-Version: 1.0
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] STI framebuffer and PINE
References: <20020714091619.B1E35483A@dsl2.external.hp.com> <20020715142028.J27706@parcelfarce.linux.theplanet.co.uk> <1026743879.30202.5.camel@irongate.swansea.linux.org.uk>  <20020715143909.K27706@parcelfarce.linux.theplanet.co.uk> <20020715215022.A8251485D@dsl2.external.hp.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Grant Grundler wrote:

>Matthew Wilcox wrote:
>  
>
>>But the K class hardware is not well supported.  Lan and Console
>>are the only two devices which really work; the SCSI cards don't use the
>>normal NCR/Symbios chips but a proprietary chip instead.
>>    
>>
>
>Not entirely correct. K-class has both HSC (GSC follow-on) and HP-PB "slots".
>IIRC, the built-in SCSI is HSC based. But you are right in that all the HP-PB
>crud isn't supported.
>
>  
>
>>Hmm.. anyone want to do a `testimonials' section on the website which
>>lists peoples (successful ;-) experiences with using PA/Linux in
>>production environments?
>>    
>>
>
>ESIEE folks have that already in their "what's supported" HW listing.
>Please see the ESIEE "puffin" site for where to submit them.
>  
>
I don't think Matthew wath thinking about that. This HW list gives just 
an indication if this is working or not.
What I understand here is a list of something like:
I currently use a B132 in production environment since November, 2001. 
It provides a CVS server, apache with PHP and  a postgresql database. 
The kernel is pretty old (2.4.14-32), but the only shutdown (and end of 
services) I had to notice where caused by powerfailure.
Use of Php is quite recent.
Matthew, does these (real) example correspond to your suggestion?

>  
>
>[...]
>
>hth,
>grant
>_______________________________________________
>parisc-linux mailing list
>parisc-linux@lists.parisc-linux.org
>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
>
>  
>
