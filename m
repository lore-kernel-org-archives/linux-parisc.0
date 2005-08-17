From: "Michael S. Zick" <mszick@morethan.org>
Subject: Re: [parisc-linux] B132L outperforms C160 - 64-bit userland needed?
Date: Tue, 16 Aug 2005 20:48:34 -0500
Message-ID: <200508162048.35131.mszick@morethan.org>
References: <200508170132.j7H1W4Sq027309@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-2022-jp"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200508170132.j7H1W4Sq027309@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue August 16 2005 20:32, John David Anglin wrote:
> > >>When that produced even worse results, I tried -march=2.0 vs 1.1 and
> > >>-mschedule=8000 vs 7300 seperately.  Each one alone slows down the
> > >>benchmark and the effect is addititive.  It seems that in Linux, right
> > >>now at least, compiling with -march=2.0 or -mschedule=8000 is a Bad Thing.
> > >>
> 
> In theory, -mschedule=8000 should only be used on machines with PA 2.0
> processors (i.e., not the B132L).  It is tweaked to the number of execution
> units, etc, in the PA 2.0 processor.  How much difference this makes in the
> real world is not clear.  I haven't seen any numbers.  As far as the
> models themselves, they haven't changed since they were added by Jeff
> Law somewhere around GCC 3.0.  It would be interesting to see how they
> compare on the same cpu, same os, etc.
>
One other suggestion.

Try running the Povray benchmark - It is compute intensive and long
enough running to turn other kernel activity into noise.

You should be able to just: apt-get povray 
But it could be that the benchmark is separately packaged.

I think Joel tried hppa-Povray - he might have information to share.

Mike
 
> As far PA 2.0 versus 1.1, the main differences affecting 32-bit code
> are some new branch instructions.  There are also some new FP instructions
> but these are somewhat compromised by linker bugs.  In non floating-point
> code, I would expect the PA 2.0 features to make their presence felt
> in code with large functions.
> 
> > > It would be interesting to see if this also holds with a newer GCC.
> > > (3.4, 4.0, 4.1)
> 
> There have been a lot of optimization improvements in GCC since 3.3.
> It would be useful to see how effective they are in real applications
> and in benchmark performance.  As far as the PA backend goes, there
> haven't been any major performance improvements added since 3.3.  The
> changes mainly are bug fixes.
> 
> > I can't see how it would be different.  Isn't compiling for PA2.0/8000
> > in Linux tying of GCC's hands behind its back.  You're telling it you
> > want good code for a 64-bit CPU, but it can't produce 64-bit code.
> > 
> > Is there any real possibility that this is compiler-related and not
> > simply a 32 vs. 64 bit issue?  If there is a real chance of this, I'll
> > bite the bullet and actually test out newer GCC versions.
> 
> 64-bit code isn't going to make your apps run faster.  There is more
> overhead in data accesses in 64-bit code (i.e., they go through the DLT)
> than in 32-bit apps.  Also, a lot more sign extensions are needed.  In
> terms of a GCC build, the difference is about 15-20%.  The 64-bit tools
> are less mature.  So generally, you only want to use 64-bit apps when
> they can benefit from the larger address space.
> 
> > I have not yet compiled a 64-bit kernel for my C160.  All advice I have
> > read is that this is a complete waste of time since without a 64-bit
> > userland it will just make the kernel bigger and slower.  Is there
> > likely to be any benefit at all to a 64-bit kernel?
> 
> I doubt it.  You only want to use a 64-bit kernel when you have a machine
> with lots of memory.
> 
> Dave
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
