Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust100.bre.cable.ntl.com [213.107.176.100])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6D414482B
	for <parisc-linux@parisc-linux.org>; Wed, 19 Dec 2001 14:04:40 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 59CF2B00C; Wed, 19 Dec 2001 21:03:29 +0000 (GMT)
Date: Wed, 19 Dec 2001 21:03:29 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Andy Walker <squawker@start.no>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Status report - B132L and 725/100
Message-ID: <20011219210329.E1897@linuxcare.com>
References: <1008589643.3c1ddb4b75583@nyepost.start.no> <1008594958.3c1df00ed9750@nyepost.start.no> <20011219113621.X1897@linuxcare.com> <1008771313.3c20a0f14484a@nyepost.start.no> <20011219165635.3E405482A@dsl2.external.hp.com> <001b01c188cb$cb1eda60$0201a8c0@andy> <squawker@start.no> <20011219204048.2140B482A@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011219204048.2140B482A@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Wed, Dec 19, 2001 at 01:40:48PM -0700
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

On Wed, Dec 19, 2001 at 01:40:48PM -0700, Grant Grundler wrote:
> "Andy Walker" wrote:
> > by the 53c8xx driver, it says differential on the external connector -
> > there can't be any doubt, can there? This should all work together.
> 
> It sounds like it should all just work. Especially if HPUX works.
> But HPUX sometimes cripples the bus speed or *wideth* based
> on what PDC tells it. Perhaps you need to do the same. I really
> don't expect any issues with bus speed on differential SCSIs.
> Possibly a wide vs narrow bus issue (Chip thinks it's wide and the cabling
> is narrow). We see that on C3k still and I started (but didn't finish)
> the code to query PDC about Host SCSI ID, bus speed, and width.
> 
> > Anyway, I'll take an known good disk with me tomorrow and try that with
> > a different internal cable. I'll also double check that everything is
> > still working with HP-UX. More news as it breaks.........
> 
> Yeah - if HPUX boots/talks to the devices, they are basically ok.
> It's a matter of getting the linux driver the right parameters then.
