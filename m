Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id LAA31031
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Nov 2000 11:06:09 -0700
Received: from adlmail.cup.hp.com (adlmail.cup.hp.com [15.0.100.30])
	by atlrel2.hp.com (Postfix) with ESMTP id 482AECA9
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Nov 2000 13:08:24 -0500 (EST)
Message-Id: <200011221806.KAA06196@adlmail.cup.hp.com>
Subject: Re: [parisc-linux] Use of the EI_OSABI field
Date: Wed, 22 Nov 2000 10:06:05 -0800
From: Cary Coutant <cary@cup.hp.com>
To: "H . J . Lu" <hjl@valinux.com>, "Alan Modra" <alan@linuxcare.com.au>
Cc: "Ulrich Drepper" <drepper@cygnus.com>,
        "John Marvin" <jsm@udlkern.fc.hp.com>,
        <parisc-linux@puffin.external.hp.com>,
        <parisc-linux@thepuffingroup.com>, <binutils@sourceware.cygnus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
List-ID: <linux-parisc.vger.kernel.org>

As the original author of the proposal to add the EI_OSABI field to the 
ELF format, let me try to clarify the intent of this field. The 
authoritative definition of this field is found in SCO's gABI document, 
which is still the official specification for the ELF format (this is 
probably posted somewhere on SCO's web site). Here's what it says:

    Byte e_ident[EI_OSABI] identifies the operating system and
    ABI to which the object is targeted. Some fields in other ELF
    structures have flags and values that have operating system
    and/or ABI specific meanings; the interpretation of those
    fields is determined by the value of this byte. The value of
    this byte must be interpreted differently for each machine.
    That is, each value for the e_machine field determines a set
    of values for the EI_OSABI byte. Values are assigned by the
    ABI processor supplement for each machine. If the processor
    supplement does not specify a set of values, the value 0
    shall be used and indicates unspecified.

The first sentence is still a bit misleading, and is an artifact of the 
original proposal. Originally, the field was intended to identify the 
target ABI (hence the name of the field). As we started discussing a 
common Unix ABI for IA-64, however, it became clear that this field 
wouldn't serve that purpose, but it was still needed to identify the set 
of platform-specific ELF extensions that are used by the object file.

There are a number of fields in the ELF format for which ranges of values 
or a set of flag bits are reserved for vendor-specific use (e.g., 
SHT_LOOS through SHT_HIOS for vendor-specific section types, and 
SHF_MASKOS for vendor-specific section attributes). If an object file 
uses any of these values or flag bits, the consumer of the file must 
consult the EI_OSABI field to determine what those values or flags mean. 
It works just like the e_machine field does for attaching meaning to 
processor-specific values and flags.

The intent is that any ABI-conforming implementation will be able to 
execute an ABI-conforming binary, even if it uses certain vendor-specific 
features. In many cases, those vendor-specific features are hints for a 
particular OS that can be ignored by other implementations. Where this is 
not the case, and a vendor-specific feature must be understood by the 
system in order to process the file correctly, we have a couple of 
alternatives.

For section types and flags that a linker must understand, we have the 
SHF_OS_NONCONFORMING flag -- if set, and a linker doesn't understand a 
particular section type or flag, it must reject the file.

For executables that will execute only on a particular implementation, we 
must use an alternate interpreter (PT_INTERP) or bind to 
implementation-specific shared libraries. An ABI-conforming binary will 
use the interpreter specified in the psABI spec, and will use only system 
libraries specified there.

For statically-bound programs, I'm afraid we don't have a clear solution. 
We took the general approach that such programs are not ABI-conforming in 
the first place, and can use any mechanism they might choose to verify 
that they are executing on the appropriate implementation.

-cary
