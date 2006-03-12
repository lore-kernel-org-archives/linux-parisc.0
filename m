From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] Re: gcj can't make shared libs on hppa
Date: Sun, 12 Mar 2006 22:12:47 +0800
Message-ID: <44142C5F.3040509@tausq.org>
References: <200603120210.k2C2AvIw012101@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
To: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200603120210.k2C2AvIw012101@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> r22 should be pointing to a function descriptor and have the plabel
> bit set.  It's a relative rare situation when an indirect call can
> be made directly (no shared libraries).

I know, but that's not what's happening....

__do_global_ctors_aux() looks like this:

static void __attribute__((used))
__do_global_ctors_aux (void)
{
   func_ptr *p;
   for (p = __CTOR_END__ - 1; *p != (func_ptr) -1; p--)
     (*p) ();
}

what i'm seeing is that we are calling the copy of this function in 
liba1.so, and loading __CTOR_END__ via the GOT, but we are using an r19 
value that is pointing inside libgcj.so, so we end up loading some wrong 
value for __CTOR_END__

I don't know how/why this is happening though. how does this bit work? 
each .so has its own copy of __do_global_ctors_aux(); how does this get 
called and where does it setup r19 for each .so before this gets called?

randolph
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
