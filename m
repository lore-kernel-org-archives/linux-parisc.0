From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] FW: An HP doc for TLDP
Date: Tue, 22 Jun 2004 23:19:09 -0600
Message-ID: <20040623051909.GD27085@colo.lackof.org>
References: <001a01c458c0$949e1650$df6ddacf@athlon>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Greg Porter <gporter@tcsn.net>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <001a01c458c0$949e1650$df6ddacf@athlon>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Jun 22, 2004 at 06:22:36PM -0700, Greg Porter wrote:
> Hi, I noticed that linux documentation regarding Hewlett Packard unix
> server hardware (PA-RISC) is lacking.? I recently taught myself DocBook,
> and have started documenting some specifics of HP hardware.? 

Cool. But it's really not *that* badly documented.
See the user manuals in ftp://ftp.parisc-linux.org/docs/platforms/.
Nearly all of them describe how to get to BCH and what one can
do there for example.

> For example, I recently documented HP server firmware with DocBook,
> please see http://www.porterdavis.org/computing/hp_boot/ for an
> example.

You *really* want to have those sections reviewed by other volunteers
before submitting them to TLDP.

Here are some example comments from ch02 at:
	http://www.porterdavis.org/computing/hp_boot/ch02.html

| Getting a PDC prompt

You skipped console setup. things like how to setup a serial console
vs graphical, disconnecting Keyboard/mouse to force serial console,
<TAB>-key at poweron, etc.

BTW, in "HP speak" a PDC prompt is properly called a Boot Console Handler
(BCH) prompt. And there are several versions (depending on which
generation of box (eg "BOOT_ADMIN" is what many older boxes have).

| Processor Dependent Code (PDC) is HP speak for the firmware that comes
|  on an HP.

...on a PA-RISC machine.
Hitachi and Precision Engeering also made PA-RISC machines.

> ?
> The next rev of the document will have a section on updating the
> firmware as well.  This may be of use to you.

Yes, I suppose it will help some poor soul figure out what they
just bought on ebay. ;^)

> P.S.  The Linux Documentation Project people are considering whether to
> accept this as a TLDP document.

Please just make sure it's reviewed first.

thanks,
grant


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
