From: Randolph Chung <randolph@tausq.org>
Subject: [parisc-linux] Re: pa_memcpy: 2 small question
Date: Mon, 10 Jan 2005 00:54:46 -0800
Message-ID: <20050110085446.GS18497@tausq.org>
References: <20050110001356.GO18497@tausq.org>
	<41DE919200000904@mail-2-bnl.tiscali.it>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <41DE919200000904@mail-2-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I need obvioulsy to understand those details beacuse to work with str I would
> need to check somehow if there are a byte == 0 in the on going word (I already
> find a formula to do this into other arch) to jump to byte_copy (so need
> more work ;-)

maybe you can use something like (not tested):

loop:
ldw 0(source),tmp
uaddcm,nbz tmp,%r0,%r0
b,n byte_copy
b loop
stw tmp, 0(dst)

byte_copy:
....

uaddcm should be able to let you determine if there are any 0's in the
current word in a single insn.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
