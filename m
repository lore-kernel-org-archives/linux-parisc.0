From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [klibc] [parisc-linux] klibc parisc64
Date: Mon, 24 Jul 2006 16:17:13 -0700
Message-ID: <44C554F9.9020402@zytor.com>
References: <200607242311.k6ONBMY0004933@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: klibc@zytor.com,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200607242311.k6ONBMY0004933@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

John David Anglin wrote:
>> H. Peter Anvin wrote:
>>> (k)libc.so isn't a shared library in the ELF sense.  It's an executable.
>>>
>> ... specifically, as far as ELF (and the kernel) is concerned, it's the 
>> ELF interpreter; it's linked at a fixed address and the application 
>> invokes it with usual static jumps.
> 
> "Usual static jumps"?  There's nothing usual about static jumps on
> the PA ;(  However, it should be possible to jump to a static address
> with the right setup.
> 
> The 64-bit linker hasn't really been ported to linux.  The interpreter
> section is hardcoded to ELF_DYNAMIC_INTERPRETER:
> 
> #define ELF_DYNAMIC_INTERPRETER "/usr/lib/pa20_64/dld.sl"
> 
>       /* Set the contents of the .interp section to the interpreter.  */
>       if (info->executable)
> 	{
> 	  s = bfd_get_section_by_name (dynobj, ".interp");
> 	  BFD_ASSERT (s != NULL);
> 	  s->size = sizeof ELF_DYNAMIC_INTERPRETER;
> 	  s->contents = (unsigned char *) ELF_DYNAMIC_INTERPRETER;
> 	}
> 

OK, well then it's probably pointless to try to get 64-bit klibc up and 
running on it at this point.  That's fine, though; we can just use 32-bit.

	-hpa
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
