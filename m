From: Helge Deller <deller@gmx.de>
Subject: Re: kernel segv with 2.6.31-rc6 ?
Date: Thu, 20 Aug 2009 23:45:17 +0200
Message-ID: <4A8DC3ED.4060005@gmx.de>
References: <20090820185550.979544E7A@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: rusty@rustcorp.com.au, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org, dave.anglin@nrc.ca,
	roland@redhat.com, James.Bottomley@HansenPartnership.com
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090820185550.979544E7A@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 08/20/2009 08:55 PM, John David Anglin wrote:
>> The reason seems to be, that something in the newer gcc compilers changed to generate multiple sections all named ".text" for the PCREL17 relocations.
>> Older compilers named those sections ".text.1", ".text.2", ".text.3" and so forth.
>
> GCC has never generated ".text.1", etc, on parisc linux as far as I know.

Hmm, I don't like to disagree with an gcc-expert like you,but
I did pasted an objdump in my last mail, which shows that gcc did
generated .text.1, .text.2 and so on:

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
   0 .text         00000000  00000000  00000000  00000034  2**0
                   CONTENTS, ALLOC, LOAD, READONLY, CODE
...
   4 .text.1       00000000  00000000  00000000  000000b0  2**0
                   CONTENTS, ALLOC, LOAD, READONLY, CODE

Helge
