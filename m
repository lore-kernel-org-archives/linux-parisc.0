From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] ext3 perf patch#2
Date: Sat, 26 Mar 2005 14:39:12 -0700
Message-ID: <20050326213912.GB9287@colo.lackof.org>
References: <20050326103540.GA31557@colo.lackof.org>
	<42454E7C.3050509@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42454E7C.3050509@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Mar 26, 2005 at 11:58:52AM +0000, Joel Soete wrote:
> is the ~63 or 63UL?

63UL is better. But in this case it really doesn't matter.
The bitmaps aren't (yet) 512MB in size.

It should be ~(BIT_PER_LONG-1)....the next step to make the
whole thing usable for 32-bit.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
