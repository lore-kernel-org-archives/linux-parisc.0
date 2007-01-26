From: Kyle McMartin <kyle@parisc-linux.org>
Subject: Re: [parisc-linux] Help with J5600 (Model: 9000/785/J5600)
Date: Thu, 25 Jan 2007 19:05:39 -0500
Message-ID: <20070126000539.GB13938__45686.3864594654$1416624635$gmane$org@athena.road.mcmartin.ca>
References: <epbfs6$62t$1@sea.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Michael Greene <listsnews@cox.net>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <epbfs6$62t$1@sea.gmane.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Jan 25, 2007 at 06:52:39PM -0500, Michael Greene wrote:
> I am trying to get any version of hppa linux running on an old J5600, 
> <snip>
> SBA found Astro 2.1 at 0xfed00000
> Elroy version TR4.0 (0x5) found at 0xfed30000
> PCI: Enabled native mode for NS87415 (pif=0x8f)
> iosapic: 0xfed30800 : no IRT entry for slot 12, pin 1
> iosapic: no IRTE for 0000:00:0c.0 (IRQ not connected?)
> iosapic: 0xfed30800 : no IRT entry for slot 13, pin 1
> iosapic: no IRTE for 0000:00:0d.0 (IRQ not connected?)
> iosapic: 0xfed30800 : no IRT entry for slot 14, pin 4
> iosapic: no IRTE for 0000:00:0e.2 (IRQ not connected?)
> iosapic: 0xfed30800 : no IRT entry for slot 15, pin 1
> iosapic: no IRTE for 0000:00:0f.0 (IRQ not connected?)
> iosapic: 0xfed30800 : no IRT entry for slot 15, pin 1
> iosapic: no IRTE for 0000:00:0f.1 (IRQ not connected?)
> Elroy version TR4.0 (0x5) found at 0xfed32000

Do you have any PCI cards in this machine? Something is badly
broken in the firmware.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
