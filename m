Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from vopserver.pflashcom (mail.pflash.com [207.19.136.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4745F4860
	for <parisc-linux@parisc-linux.org>; Wed,  6 Mar 2002 08:12:03 -0700 (MST)
Received: from localhost.localdomain (ppp61.cc1.pflash.com [63.121.24.63]) by vopserver.pflashcom
 (Vircom SMTPRS 1.1.219) with SMTP id <B0010835135@vopserver.pflashcom> for <parisc-linux@parisc-linux.org>;
 Wed, 6 Mar 2002 09:04:36 -0600
Content-Type: text/plain;
  charset="iso-8859-1"
From: Michael S.Zick <mszick@pflash.com>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] SMP support
Date: Wed, 6 Mar 2002 09:10:31 -0600
References: <Pine.LNX.4.33L2.0203051434270.6941-100000@eiger.apptechsys.com> <20020306010541.A8BB84853@dsl2.external.hp.com>
In-Reply-To: <20020306010541.A8BB84853@dsl2.external.hp.com>
MIME-Version: 1.0
Message-Id: <02030609103100.00899@localhost.localdomain>
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

On Tuesday 05 March 2002 07:05 pm, Grant Grundler wrote:
> Jeremy Drake wrote:
> > I am running debian-hppa on a J5000, and I am using the 2.4.17-32-smp
> > kernel.  It detects both processors at boot, and shows them both in
> > /proc/cpuinfo, but /proc/stat shows this
> >
> > cpu  599904 33379482 34656795 68636319
> > cpu0 0 0 64 68636186
> > cpu1 599904 33379482 34656731 133
> >
Folks, 
for comparison: (2.4.17 on an x86 smp-box)

cpu  2867 96 1822 231717
cpu0 1400 37 671 116143
cpu1 1467 59 1151 115574

Mike
