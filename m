From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] [BUG] 2.6.8-1-32 Debian kernel panics in harmony
Date: Thu, 11 Nov 2004 00:38:50 -0700
Message-ID: <20041111073850.GA9768@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Stuart/et al ,

I was playing around with the b180 I've setup for a friend
of the family (11 year old kid) and pretty quickly
panic'd the 2.6.8-1-32 debian kernel.

I wanted to reproduce it again with serial console so
I could grab the tombstone but serial console didn't have a
getty and networking wasn't config'd...so I give up for now.
But I think it's easy enough to reproduce...

I played an mp3 with "mpg321 foo.mp3" and then ^C
that after it played for 10-20 seconds. first it gave
noises like it was looping on a garbage buffer.
I restarted the mpg and it played fine again.
Hit ^C again and again got noise.
Repeat playing the same mp3 one more time and then got a kernel panic.
panic was in the harmony interrupt routine and apologize if
that's too vague.

Please remind me tomorrow what other info is needed and
if the tombstone is necessary.

thanks,
grant

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
