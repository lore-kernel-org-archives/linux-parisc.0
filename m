From: Ulrich Teichert <krypton@ulrich-teichert.org>
Subject: Re: [parisc-linux] kernel module relocation bug
Date: Mon, 29 Nov 2004 20:27:32 +0100 (MET)
Message-ID: <200411291927.iATJRY3e032306@arbas.nms.ulrich-teichert.org>
References: <1101742439.1714.11.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: James.Bottomley@SteelEye.com (James Bottomley)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1101742439.1714.11.camel@mulgrave> from "James Bottomley" at Nov
	29, 2004 09:33:53 AM
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi,

>> currently the kernel module loader does not support long branch stubs.
>> using the debian 2.6.8-1 kernel, when loading the ipv6 module, i see:
>> 
>> legolas[6:43] linux-2.6% sudo modprobe ipv6
>> FATAL: Error inserting ipv6 (/lib/modules/2.6.8-1-32-smp/kernel/net/ipv6/ipv6.ko): Invalid module format
>
>This is pretty nasty.  The problem isn't a bad relocation, its that the
>relocation target is too far away (i.e. ipv6 is too big).

I've seen this quite often in userspace on hppa-linux, lately while building
TAO (http://www.cs.wustl.edu/~schmidt/TAO.html).

>We get around this in the kernel by using -ffunction-sections so that
>the real linker can insert stubs between functions.  However,
>calculating how to do that in the in-kernel module loader would not be a
>whole lot of fun.

Wouldn't there a way to fix that somewhere else in the toolchain? Or is
there a parisc machine code limitation in the way? I would really get rid of
-ffunction-sections as it seems to generate slower executables. Could
you please explain what needs to be done?

TIA,
Uli
-- 
Dipl. Inf. Ulrich Teichert|e-mail: Ulrich.Teichert@gmx.de
Stormweg 24               |listening to: Suicide Drive (The Deep Eynde)
24539 Neumuenster, Germany|Public Pervert (Interpol) Clé De Contact (Metal Urbain)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
