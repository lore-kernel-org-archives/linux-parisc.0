From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] parisc: convert /proc/pdc/{lcd,led} to seq_file
Date: Tue, 1 Dec 2009 14:07:46 -0800
Message-ID: <20091201140746.8d0e740e.akpm@linux-foundation.org>
References: <20091127065112.GC26327@x200.malnet.ru>
	<20091128061354.GA21113@lackof.org>
	<20091128092509.GA4375@x200.malnet.ru>
	<20091129051752.GA14332@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Alexey Dobriyan <adobriyan@gmail.com>, kyle@mcmartin.ca,
	linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091129051752.GA14332@lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 28 Nov 2009 22:17:52 -0700
Grant Grundler <grundler@parisc-linux.org> wrote:

> > Yes, it's slightly less racy than create_proc_entry().
> > create_proc_entry() is going to be removed in fact.
> 
> Ok. Please add a sentence about which race you are worried about.
> This isn't to discuss the race - it's just informative to explain
> why there is a plan to replace the API. I'm willing to go along with
> that.
> 
> Are you removing create_proc_entry() ? Is this patch part of a grand plan?
> (All good things to include in a commit comment)
> 
> Also updating Documentation/filesystems/seq_file.txt would be very
> helpful given you understand why proc_create_data() should replace
> create_proc_entry().

yeah.  I didn't even know that this was the reason and I've been
applying the patches like crazy.  Heaven knows what a random developer
of a remote subsystem is supposed to make of such a patch.  Probably he
just assumes that someone else knows what's going on.

Alexey, please, don't do this.


Please send me some boilerplate text which I can paste into

thinkpad_acpi-convert-to-seq_file.patch
asus_acpi-convert-to-seq_file.patch
toshiba_acpi-convert-to-seq_file.patch
arm-convert-proc-cpu-aligment-to-seq_file.patch
proc_fops-convert-drivers-isdn-to-seq_file.patch
proc_fops-convert-drivers-isdn-to-seq_file-fix.patch
mpt-fusion-convert-to-seq_file.patch
pnpbios-convert-to-seq_file.patch
uml-convert-to-seq_file-proc_fops.patch
alpha-convert-srm-code-to-seq_file.patch
parisc-convert-proc-pdc-lcdled-to-seq_file.patch
via-pmu-convert-to-proc_fops-seq_file.patch
