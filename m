Return-Path: <soete.joel@tiscali.be>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 82715489D
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 31 Jan 2004 04:51:47 -0700 (MST)
Message-ID: <401B975B.4020107@tiscali.be>
Date: Sat, 31 Jan 2004 11:54:03 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] B2k and CONFIG_PDC_CONSOLE progress
References: <4015311000001F53@ocpmta2.freegates.net>
	<20040130195509.GA15482@colo.lackof.org>
In-Reply-To: <20040130195509.GA15482@colo.lackof.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi Grant,

Grant Grundler wrote:
> On Wed, Jan 28, 2004 at 07:05:14PM +0100, Joel Soete wrote:
> 
>>Well, i made some small progress: i reach to figure out that PAGE0 status
>>changes between pdc_console_init() and pdc_io_getc():
> 
> ....
> 
>>Is somebody have a small idea when this change could occurs?
> 
> 
> PDC messes with page0 as well.
> You have the read the PDC ERS for each PDC call to determine
> what "side effects" it has. Consider Page Zero "shared mem"
> for the guest OS (HPUX or Linux) and PDC.
> 
Ha ok, I still have to learn more :)

For the moment I reach to avoid any crash of 2.4 with pdc_console either I boot from graphics(0) or serial_1.
My patch works well (i can read from pdc kdb) for serial_1 but for graphics(0), I get well a login prompt from pdc
but unfortunately I don't yet reach to read from usb kbd.
But does it make sense to have pdc_console when we have an sti console?
(imho it have well sense for a serial and lan console. Please advise.)

Thanks again,
	Joel
