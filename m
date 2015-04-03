From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: E Class and SCSI (53c700 driver)
Date: Sat, 04 Apr 2015 01:09:59 +0300
Message-ID: <1428098999.2221.34.camel@HansenPartnership.com>
References: <5519CA2B.9060407@gmail.com>	<551CF8D9.3020506@gmx.de>
		<1427965174.3559.110.camel@HansenPartnership.com>
		<BLU437-SMTP517D1501AE614C12AA19EC97F20@phx.gbl>
		<1427975884.3559.155.camel@HansenPartnership.com>
	 <CAP6odjgS6KHvB=CHybquCJ4T_hTw5awrF5hzXUENQzOb7Su7Gg@mail.gmail.com>
	 <551E860C.6090701@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Grant Grundler <grantgrundler@gmail.com>,
	John David Anglin <dave.anglin@bell.net>,
	Helge Deller <deller@gmx.de>, debian-hppa@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Dmitry the Zuryanovich <dreadbit@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <551E860C.6090701@gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 2015-04-03 at 15:22 +0300, Dmitry the Zuryanovich wrote:
> > And I finally found the name of the SCSI chip in the above doc: SPIFI
> > (v3).  The "Fast-Wide HVD" NIO card uses SPIFI v4.
> 
> 
> http://xepb.org/dtz/2015E25.html - here is photos of the boards, if this 
> helps.

Well, I think that tells us it's not Symbios (or NCR as it was then)
53c700 based.  It looks like there's a custom HP ASIC, probably for the
PB connection and a Xilinx FPGA which may be configured to run the bus.

James


