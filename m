From: Joel Soete <soete.joel@tiscali.be>
Subject: lstrncpy_from_user() additional question [Was: [parisc-linux] test
	case for pa_memset() ;-)]
Date: Sun, 19 Dec 2004 20:34:34 +0000
Message-ID: <41C5E5DA.8000906@tiscali.be>
References: <418A80250001032B@mail-2-bnl.tiscali.it>
	<20041216163417.GL29171@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041216163417.GL29171@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Randolph,

I would like to get your opinion about the idea to re-write this lstrncpy_from_user() in c as you did with pa_memcpy() (may be 
easiest to maintain?)

Thanks,
	Joel


Randolph Chung wrote:
>>Any interest?
>>
>>This tmset3.c is a very draft and all advise will be welcome :-)
> 
> 
> Joel, i didn't notice earlier that you were working on memset.... i
> don't think you'll see much improvement over our current implementation.
> memcpy was a target for optimization because it used to copy
> *one-byte-at-a-time*, but our memset already knows about byte boundaries
> and tries to write more at a time when possible. i suspect you are
> seeing slower results with your implementation because of increased code
> size and branch hits. you're unlikely to see much improvement compared
> to the current version unless you either unroll the loop or do some more
> clever instruction scheduling.
> 
> the three routines in arch/parisc/lib/lusercopy.S are probably better
> targets for optimization because they are all doing one-byte-at-a-time
> operations, so there is more room for improvement.
> 
> randolph
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
