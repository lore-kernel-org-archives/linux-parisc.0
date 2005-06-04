From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Linux on a HP 9000/800/N4000-36
Date: Sat, 4 Jun 2005 12:40:54 -0600
Message-ID: <20050604184054.GF19823@colo.lackof.org>
References: <42A0B12D.8070602@xtech.com.ar>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Roel <Rule@freegates.be>,
 Peter Van Loock <pvl@maxon.be>,
 parisc-linux@lists.parisc-linux.org
To: Daniel Coletti <dcoletti@xtech.com.ar>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42A0B12D.8070602@xtech.com.ar>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Jun 03, 2005 at 04:36:13PM -0300, Daniel Coletti wrote:
> Since I used the HP console I don't have the full output,

Daniel,
can you try to capture the full output?
And then post it to parisc-linux@lists.parisc-linux.org?

I need to know which kernel you are running.

Here are more tips on how to report kernel bugs:
	http://www.parisc-linux.org/faq/kernelbug-howto.html


> Kernel bug at lba_pci.c:1285!
> Kernel bug at lba_pci.c:1250!
> lba range[2]: ignoring GMMIO (0x-a-lot-of-hexa-numbers)

This won't prevent the box from booting.

> I tried with debian-woody official ISO (downloaded from debian), is 
> there something special that I have to do with the HP N-class?
> Is there another kernel I should try out?

Yes, probably. Joel should be able to point at one on
http://cvs.parisc-linux.org/download/linux-2.6 that
will work for you.

Getting it on the machine is another issue.
See the other thread on debian-hppa mailing list for ideas
on how to replace a kernel on a non-booting machine.

grant

> 
> thanks a lot.
> 
> daniel///
> -- 
> Daniel Coletti
> XTech (Soluciones Linux para Empresas) - http://www.xtech.com.ar
> 25 de Mayo 293 - 5to. 'B'
> Buenos Aires, Argentina
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
