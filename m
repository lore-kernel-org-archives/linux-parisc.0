From: Randolph Chung <randolph@tausq.org>
Subject: [parisc-linux] OpenOffice.org on hppa
Date: Wed, 30 Mar 2005 05:45:07 -0800
Message-ID: <20050330134454.GO2485@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
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

I took a look at oo.o for hppa... it'll take quite a bit of work to get
it building. Are there enough people interested to make this happen?

Here's what I've found so far; there's probably more.

- oo.o needs libneon23-dev to build, this package is not available in
  Debian, but this is easily fixable. The package source explicitly
  disables builds on hppa, so you can just work around this by
  downloading the libneon23 source
- oo.o source needs a lot of arch-specific stuff to work:
  - build infrastructure
    debian/scripts/vars.hppa
    config_office/set_soenv.in needs to define a hppa section
    solenv/inc/ needs a hppa makefile fragment
    (probably more)
- need to write bridges code (http://porting.openoffice.org/)

i got past the first two items, but the third (bridges) is a significant
piece of work that will require some knowledge of asm and gcc c++ vtable
layouts and PA calling conventions..

if a few other people are interested, i'd be willing to help out....
but it looks like a lot of work :(

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
