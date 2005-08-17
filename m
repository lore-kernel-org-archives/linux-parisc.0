From: Kurt Fitzner <kfitzner@excelcia.org>
Subject: Re: [parisc-linux] B132L outperforms C160 - 64-bit userland needed?
Date: Tue, 16 Aug 2005 18:03:35 -0600
Message-ID: <43027ED7.10007@excelcia.org>
References: <4301B090.9040405@excelcia.org>
	<200508160800.29307.mszick@morethan.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <200508160800.29307.mszick@morethan.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Michael S. Zick wrote:

>>When that produced even worse results, I tried -march=2.0 vs 1.1 and
>>-mschedule=8000 vs 7300 seperately.  Each one alone slows down the
>>benchmark and the effect is addititive.  It seems that in Linux, right
>>now at least, compiling with -march=2.0 or -mschedule=8000 is a Bad Thing.
>>
> 
> It would be interesting to see if this also holds with a newer GCC.
> (3.4, 4.0, 4.1)

I can't see how it would be different.  Isn't compiling for PA2.0/8000
in Linux tying of GCC's hands behind its back.  You're telling it you
want good code for a 64-bit CPU, but it can't produce 64-bit code.

Is there any real possibility that this is compiler-related and not
simply a 32 vs. 64 bit issue?  If there is a real chance of this, I'll
bite the bullet and actually test out newer GCC versions.

> Try the same version kernel on both machines - you might just be seeing
> the difference between 2.6.8 and 2.6.10. (or 32bit and 64bit kernels).

I've installed 2.6.8.1 on the C160 to match the B132L.  I'm seeing a 2%
increase in speed across the board with the different kernel.  I
attribute this to my having set the CPU to 7300 in the kernel settings.
 The speed increase is exactly consistent with the difference I see in
executables on my C160 when compiled with -march1.1/-mschedule=7300
rather than 2.0/8000.  The C160 still underperforms significantly when
compared to the B132L.

I have not yet compiled a 64-bit kernel for my C160.  All advice I have
read is that this is a complete waste of time since without a 64-bit
userland it will just make the kernel bigger and slower.  Is there
likely to be any benefit at all to a 64-bit kernel?

> Also, what compiler was used to build the kernel.

Same as used to build nBench, gcc 3.3.5 (Debian 1:3.3.5-13).

	Kurt.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
