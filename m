Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5A33E482D
	for <parisc-linux@parisc-linux.org>; Tue, 15 Jul 2003 08:32:28 -0600 (MDT)
Date: Tue, 15 Jul 2003 16:31:03 +0200
Message-ID: <3F0C2302000015FA@ocpmta2.freegates.net>
In-Reply-To: <20030715141249.GT23808@parcelfarce.linux.theplanet.co.uk>
From: "Joel Soete" <jsoe0708@tiscali.be>
To: "Matthew Wilcox" <willy@debian.org>
Cc: "Matthew Wilcox" <willy@debian.org>,
	parisc-linux@parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] Re: 2.6.0-test1: Kernel pci bug ?
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

>Oops, my mistake.  It's completely harmless, but I'll commit a fix
>right now.

No pb (I would have to report it earlier also)

>> sym53c8xx: at PCI bus 0, device 19, function 0
>> sym53c8x
>>: 53c875 detected 
>> sym53c875-0: rev 0x4 on pci bus 0 device 19 function 0 irq 99
>> ERROR: SCSI host `sym53c8xx' has no error handling
>> ERROR: This is not a safe way to run your SCSI host
>> ERROR: The error handling must be added to this driver
>
>
> Can you use the sym2 driver instead of the original sym driver?

My bad: as we spook about the remove of sym1 I do not check. I will so test

>>calize_funcptr_for_compare+0x3c/0x134
>>  RP(r2): do_sigaction+0xe0/0x290
>> 
>> Any idea?
>
>This is the fatal one.  Dying in __canonicalize_funcptr_for_compare ...
>outside my realm of expertise (since i use gcc-3.0 still).

Ok I will do first retry with gcc-3.3 and sym2: report test.
If still failled comeback with gcc-3.0 and report also test.

Thanks,
    Joel

BTW Grant do you already put __canonicalise... stuff into 2.[56] I don't
reach to remember?


------------------------------------------------------
Soldes Tiscali ADSL : 27,50 euros/mois jusque fin 2003.
On s'habitue vite à payer son ADSL moins cher!
Plus d'info? Cliquez ici... http://reg.tiscali.be/default.asp?lg=fr 
