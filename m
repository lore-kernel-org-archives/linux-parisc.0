From: j.raspe@t-online.de
Subject: Re: Re: [parisc-linux] No 2.6 kernel on 735/125 with CRX24?
Date: Tue, 28 Sep 2004 13:45:44 +0200
Message-ID: <1CCGQS-0SPGFc0@filter05.bbul.t-online.de>
References: <4152E64500001139@mail-2-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-1"
Cc: parisc-linux@parisc-linux.org
To: soete.joel@tiscali.be
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4152E64500001139@mail-2-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


(...)
>> Where can I get 2.6.4-hppa-kernels? I tried the source from
www.kernel.org,
>>
>Either you choose anonymous co of cvs tree:
>see <http://www.parisc-linux.org/faq/cvs.html>

>or you grab the tarball at:
><http://cvs.parisc-linux.org/download/linux-2.6/>
>(the patch against vanilla src is also available)

>> but this seems to lack HIL-support and at the cvs.parisc-linux.org
site
>>the
>>
>> oldest kernels are 2.6.5.
>> With a 2.6.4 kernel I could verify if I have the same problem as
mentioned
>> in
>> the link above, because this problem first came up with kernels >
2.6.4.
>>
>Hmm good starting point :)

>Good luck,
>    Joel

Hi Joel,

unfortunately I can't find any suitable 2.6.4 kernel or kernel-source on
http://cvs.parisc-linux.org/download/linux-2.6/ !
The 2.4.6 kernel-source-tar.bz2 in /autobuild has no hppa-specific
extensions (no HIL-support) and the oldest pa-kernels
and pa-sources available are 2.6.5.

Any idea whre I can get 2.6.4 pa-specific kernel binaries or kernel
sources? How could I use cvs to get an old kernel source like 2.6.4?

Thanks Johannes





_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
