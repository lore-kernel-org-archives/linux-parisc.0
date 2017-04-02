From: John David Anglin <dave.anglin@bell.net>
Subject: Re: mmap problem in localedef
Date: Sun, 2 Apr 2017 16:13:10 -0400
Message-ID: <6C04F590-3BC6-46FD-8DF1-2C0D1921E591@bell.net>
References: <alpine.LRH.2.20.1612051330040.25582@math.ut.ee> <9B251251-04AB-4D78-ADD7-F0D429DEB761@bell.net> <20170401183717.jpvilw2u4lgiceuv@raspberrypi-3.musicnaut.iki.fi> <2241815.7QkIsKQeSs@daneel.sf-tec.de> <20170401191023.xpf32zopaecd7dzy@raspberrypi-3.musicnaut.iki.fi> <59CDF2DE-076C-4BC0-8381-CE31A2AA8F56@bell.net> <20170402191245.odedqsqcx2cp5xtt@raspberrypi-3.musicnaut.iki.fi> <C5E87DDC-4792-483B-835F-C396A4067174@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Helge Deller <deller@gmx.de>,
        Rolf Eike Beer <eike-kernel@sf-tec.de>,
        Meelis Roos <mroos@linux.ee>,
        "linux-parisc@vger.kernel.org List" <linux-parisc@vger.kernel.org>,
        Carlos O'Donell <carlos@redhat.com>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <C5E87DDC-4792-483B-835F-C396A4067174@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2017-04-02, at 3:49 PM, John David Anglin wrote:

> You are in the best position to explain why this value should be page size and not 4MB.  It would be good to note
> in BZ where patch is on list.

Just after I wrote this message, I noticed a slew of INEQUIVALENT ALIASES messages on console:

mx3210 login: INEQUIVALENT ALIASES 0xf8bc0000 and 0x41004000 in file ld-2.24.so
INEQUIVALENT ALIASES 0xf8bc0000 and 0x41004000 in file ld-2.24.so
INEQUIVALENT ALIASES 0xf8bc0000 and 0x41004000 in file ld-2.24.so
INEQUIVALENT ALIASES 0xf8bc0000 and 0x41004000 in file ld-2.24.so
INEQUIVALENT ALIASES 0xf8bbf000 and 0x41003000 in file ld-2.24.so
INEQUIVALENT ALIASES 0xf8bbf000 and 0x41003000 in file ld-2.24.so
INEQUIVALENT ALIASES 0xf8bbf000 and 0x41003000 in file ld-2.24.so
INEQUIVALENT ALIASES 0xf8bbf000 and 0x41003000 in file ld-2.24.so
INEQUIVALENT ALIASES 0xf8bbf000 and 0x41003000 in file ld-2.24.so
INEQUIVALENT ALIASES 0xf8bbf000 and 0x41003000 in file ld-2.24.so
INEQUIVALENT ALIASES 0xf8bbf000 and 0x41003000 in file ld-2.24.so
INEQUIVALENT ALIASES 0xf8bbf000 and 0x41003000 in file ld-2.24.so
INEQUIVALENT ALIASES 0xf8bbf000 and 0x41003000 in file ld-2.24.so
INEQUIVALENT ALIASES 0xf8bbf000 and 0x41003000 in file ld-2.24.so
INEQUIVALENT ALIASES 0xf8bbf000 and 0x41003000 in file ld-2.24.so
INEQUIVALENT ALIASES 0xf8bbf000 and 0x41003000 in file ld-2.24.so
INEQUIVALENT ALIASES 0xf8bc0000 and 0x41004000 in file ld-2.24.so
INEQUIVALENT ALIASES 0xf8bc0000 and 0x41004000 in file ld-2.24.so
INEQUIVALENT ALIASES 0xf8bc0000 and 0x41004000 in file ld-2.24.so
INEQUIVALENT ALIASES 0xf8bc0000 and 0x41004000 in file ld-2.24.so
INEQUIVALENT ALIASES 0xf8bc0000 and 0x41004000 in file ld-2.24.so
INEQUIVALENT ALIASES 0xf8bc0000 and 0x41004000 in file ld-2.24.so
INEQUIVALENT ALIASES 0xf8bc0000 and 0x41004000 in file ld-2.24.so
INEQUIVALENT ALIASES 0xf8bc0000 and 0x41004000 in file ld-2.24.so
INEQUIVALENT ALIASES 0xf8bc0000 and 0x41004000 in file ld-2.24.so
INEQUIVALENT ALIASES 0xf8bc0000 and 0x41004000 in file ld-2.24.so

They might be from firefox or glibc testsuite.

Dave
--
John David Anglin	dave.anglin@bell.net



