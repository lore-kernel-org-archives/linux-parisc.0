From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] [RFC] hppa needs a vDSO? Solves signal trampolines
	and opens up new possibilities.
Date: Mon, 13 Sep 2004 12:03:50 -0400
Message-ID: <20040913160349.GD8018@baldric.uwo.ca>
References: <20040912184553.GT1854@baldric.uwo.ca>
	<20040913000511.GU28659@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: James Bottomley <James.Bottomley@steeleye.com>,
 parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040913000511.GU28659@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> i think the analysis is correct, but i don't like the solution! :-)
> 
> various pieces of software (gcc, gdb) need to be able to read and
> analyze the signal trampoline for unwinding. putting the trampoline 
> onto the gateway page will break these applications, because the 
> gateway page is not readable by the user.

We need a vDSO implementation for hppa, and stick the trampolines into
the vDSO. gdb can still use mprotect on the vDSO mapping created by the
kernel. We can use the powerpc implementation as a reference. I think
it's sorta neat for the kernel to create a virtual DSO that userspace
can leverage. All the ELF rules apply for symbols and you can get all
the debugging info right.

Secondly the vDSO could override the CAS symbol from libc with an LWS
version since it knows that LWS exists. The older code can continue to
call a non-atomic libc version. I'm not quite sure how this works...

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
