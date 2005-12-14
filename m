From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Linux on rp8400
Date: Wed, 14 Dec 2005 11:41:48 -0700
Message-ID: <20051214184148.GA15899@colo.lackof.org>
References: <92dc10290511090202w13610049p489c16a0fc0642bb@mail.gmail.com>
	<20051109122253.GA27540@parisc-linux.org>
	<20051109161200.GA4507@colo.lackof.org>
	<92dc10290511091404q4e4d1d91k36dcbb7737fd6153@mail.gmail.com>
	<43746C1E.4070003@tiscali.be>
	<20051111143813.GB1658@parisc-linux.org>
	<92dc10290511121549p474c7e66r9fcda577c3275d47@mail.gmail.com>
	<20051114142329.GA5479@colo.lackof.org>
	<92dc10290511150744v320e7aci40ed5203c7ba95ee@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Vesa Ruokonen <vesa.ruokonen@gmail.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <92dc10290511150744v320e7aci40ed5203c7ba95ee@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Nov 15, 2005 at 05:44:53PM +0200, Vesa Ruokonen wrote:
...
> The rp8400 is stuck again, now it dies silently after detecting loop devices.
> PIM and some other data is logged at;
>  http://vantaa.fv.fi/00/palinux/rp8400-loop.txt
> Any ideas?

Can you decode 000000001030b504 (HPMC GR02) and 0x000000001030ae7c (IIA)
into kernel symbols?

It's odd that System Requestor is all Zero here:
System Responder Address     = 0xfffffffffc078000
System Requestor Address     = 0x0000000000000000

Based on previous console output, the target device is the
first CPU "Unknown machine". Sounds like IPI failed?
Or is that perhaps the first attempt to deliver interrupts
from an IO device?

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
