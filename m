Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA03981
	for <parisc-linux@puffin.external.hp.com>; Wed, 13 Sep 2000 16:45:09 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 13 Sep 2000 22:45:36 -0000
To: Alan Modra <alan@linuxcare.com.au>
Cc: Cary Coutant <cary@cup.hp.com>, parisc-linux@thepuffingroup.com
Subject: Function descriptors, etc. (was Re: [parisc-linux] userspace function pointers in the kernel)
References: <Pine.LNX.4.21.0009131447590.613-100000@front.linuxcare.com.au>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 13 Sep 2000 18:04:58 -0400
Message-ID: <878zswj6d1.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
List-ID: <linux-parisc.vger.kernel.org>

--=-=-=

Alan Modra <alan@linuxcare.com.au> writes:

> The model I'm thinking of for elf32-hppa is along these lines:
> 
> o  The linker creates a plt entry for all plabel relocs.  plt entries for
>    elf32-hppa are a function address, linkage table pointer pair, so
>    there's no need for the dynamic linker to allocate fptrs.
> o  A dynamic plabel reloc will have the function symbol, and an addend
>    into the plt.  This is a rather unusual reloc because the function
>    symbol value is ignored when calculating the final value.
> o  The dynamic linker builds a list or hash table of function symbols
>    versus plt offsets, and adjusts plabels so that only one plt entry is
>    ever used per function.

Reasons why the IA-64 scheme is better:

        a) In the scheme above, we cannot index the list/table by the
        code address of the function in the PLT slot, because the PLT
        will usually not have been relocated at the point when PLABEL
        relocations are being processed.  Thus we have to:

                1) Relocate PLT slots as we encounter them in PLABEL
                   relocations, or
                2) Store a copy of the code address in the table apart
                   from the PLT slot, or
                3) Index the table by the address of the Elf32_Sym
                   structure, by the symbol name (I think this is
                   fraught with peril), or by something else.  This
                   also requires another field in the table apart from
                   the PLT slot.

        b) The IA-64 code uses a one-to-one mapping of function code
        addresses to function descriptors, not symbols to function
        descriptors, and indexes the list/table by the code address.
        I'm not sure whether this is important or not, but something
        tells me it is.

        c) We will still have to dynamically allocate function
        descriptors for symbols obtained with dlopen() and dlsym().
        First of all, we won't have a special PLABEL relocation, so we
        would have to search the PLT of the loaded object "manually".
        Also, think about the case where:

                - libfoo.so defines foo() strongly
                - libfoo2.so defines foo() weakly
                - libfoo2.so defines bar() which calls foo()
                - our program links against libfoo.so and libfoo2.so
                - our program calls foo()
                - our program calls bar()
                - our program dlopen()s libfoo2.so
                - our program calls dlsym(libfoo2, "foo")
                - oops!  the PLT slot for foo() in libfoo2.so points
                  to the strong definition in libfoo.so, so it's
                  useless as a function descriptor.
                - I've attached a tarball of this testcase.  Run it on
                  i386 and IA-64 and see what it does :-)

        d) If we have to dynamically allocate function descriptors as
        well as uniquify relocations to PLT slots, then we basically
        have to duplicate the code in dl-fptr.c, and we lose.
        
Can we please use the IA-64 scheme or something very close to it?
(i.e. closer than what you've proposed, which, in attempting to
implement it in ld.so, does not appear to be close enough) It is
already implemented and debugged, I had it successfully working last
week modulo problems with initializers and finalizers, and I don't see
there being a significant gain in performance or memory usage with the
scheme outlined above.

What I suggest is the following:

* The linker still creates a PLT entry for all PLABEL relocs.  This is
  undoubtedly useful for local symbols, and allows us to take
  advantage of lazy linking for them (potentially a big win in libc.so
  which uses lots and lots of vtables).

* We don't have to generate dynamic function descriptors for PLABEL
  relocations to local symbols because we know that their PLT entries
  are and will remain unique to their code addresses.  Again, a win.

* Dynamic PLABEL relocs will either be *ABS* or .plt relative and
  pointing to the PLT slot for local symbols, or contain the function
  symbol and no addend for global symbols.  For the latter we will
  generate unique function descriptors dynamically using the same code
  as on IA-64.  Yes, we lose 12 bytes of memory per global symbol this
  way.  I don't think that's a big deal given that it allows us to use
  the same code path for these symbols and for dlsym().

* dlsym() will always generate a unique function descriptor dynamically.

I've implemented this and checked it in (it kludges around the addends
on global PLABEL relocations, that is easy to fix :-).  It passes my
other tests but the one below causes the linker to segfault.


--=-=-=
Content-Type: application/x-gtar
Content-Disposition: attachment; filename=weaksymtest3.tar.gz
Content-Transfer-Encoding: base64
Content-Description: Interaction of dlsym() and weak dynamic symbols

H4sIAJrxvzkAA+1YzW8bRRQfJ6bF20IDVAiJy5AmYp3Gm/3yruqkVYVjqkpJG6VEPUDlrHfX2HSz
a+x1U4SAQySkKPxRkegBzly5IlWCA9xyiGTe2x2v18bFRXKDoPOTZmfex8x745k3b8b7rvWw88Ve
6HZCbYW8GMiyLpvFItSyYhbldN0HkU2laJqmbCgmkRXFUA1Ciy/InyF0O6HVppQ4Dedv9SbJ/6PY
T6+/16zVg0CV7OnakBVZNnT9meuvwGLH62/opqKBvqapKqHydN0Yj5d8/Zt+SKtVKwzbzVo3dKtV
UcQtkc9T2Anio6Dp5IUvhVzbDbttnxrXVoWvBAE71az2X8TYJY8a//asOJ4XQ/GPX9vquFIwVRsT
4l/V1MH5X9QUjH9DNnj8nwW+qWx8mMlkEjpDZkkmJf+OEXr0FckF8upQ/53DXw5+u3zv4MnJ09Ne
r3d4vNVAdkQcPJlL8y8M8z+babyd4hweH1ZOgd24AsyjyulWIqicAPvowUnvJxzl/VQf5fhXcvTg
6Y/fk8QrdFdWJFmBGo4j2uzQRUcgcFr1m1KS5joBqmBR+0Jyq1wuUfHWnZ08VaVrRUmlKu5RTdGo
uO7WmpZPQbiy0fS7j/OESBg7Vg3qsB3XjX4rdB+HRGq7Hms5VmgRqdbpEMkPQhdEQcyyg7091w+f
f83eZfM8x+ibUL5NyedY/R6UXIrfyhKyy3jYH8jod7vK6Fmm98OIvSyrFaY/Sc+Acj7FR73LKbq/
v9ZYe4bRP0PRxuitp9qIS0CsjNF7I+Ub4gYINsfopW1G40On36HGtJVj85hj7fR4ejb2eXS8UaT5
WfJHLy2bHek1O2QB6Sy5+MzRUH5uhH5lhD4f7Q8E7ok3oT9NyXFeCyP01RF6ZYQ2RmiS5AmbfGrb
ahV2cKvpuY5E9qymHwVVqw2XhDrGHXG8oOX6UEGsEDwEZuCHfgtnBlN5B2lgYtTPXGR7Efgy419n
9AdIv0bINqM/Rvp1Qj5n9COmz/HPMD7/T/cBMOn+r5lacv83TD3K//AM4Pn/DHCl6dte13HpmuPV
bV9q3Iiv9xjIYnS3x0s+XWpYvuO5q0IOheIS5sx8fP9fFYRcHO3ifJJxP/Hnl+PnAMgTcZKFIzG+
ICJxPDa9TuOTQpxPp2hQ3P5oY7165+591I2SNWrCphXjjssU7c6nDQ1Set8RNTbFHioyf6QwjHn/
T/v5PzH+ZS15/yvx/z+aqss8/s8CGM7jXvq6ykPkZcBQ/G9aD906XOSmbGNS/OuqOnj/m3IU/0WT
x/9ZwPK8Uon2L36UZYBOQAcZWBAW4Vuii5IXCLkFsVzO00KnYbVdhxYCunCTLqyhjhfp2IlKfet2
mRbsgY60tV0p3767c4+NJfTNDhyQgvEu9MeMhkopF+57y4V2ywobUXO3te/s0sKGRAse3kWirwqV
4wmC7bmWX8KhtjfRPboETsAHLCXzX/qan3kcHBwcHBwcHBwcHBwc/0P8CS0V3kYAKAAA
--=-=-=


-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.

--=-=-=--
