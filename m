Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sources.redhat.com (sources.redhat.com [66.187.233.205])
	by dsl2.external.hp.com (Postfix) with SMTP id E9D284829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 15 Mar 2003 00:54:02 -0700 (MST)
Date: 15 Mar 2003 07:54:02 -0000
Message-ID: <20030315075402.24390.qmail@sources.redhat.com>
To: gcc-gnats@gcc.gnu.org
Cc: debian-gcc@lists.debian.org, parisc-linux@lists.parisc-linux.org
From: Randolph Chung <tausq@debian.org>
Reply-To: Randolph Chung <tausq@debian.org>
Subject: [parisc-linux] [3.3 regression] internal compiler error: in cp_expr_size, at cp/cp-lang.c:307
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

>Category:       c++
>Synopsis:       [3.3 regression] internal compiler error: in cp_expr_size, at cp/cp-lang.c:307
>Confidential:   no
>Severity:       serious
>Priority:       medium
>Class:          ice-on-legal-code
>Submitter-Id:   net
>Originator:     Randolph Chung <tausq@debian.org>
>Release:        3.3 20030309 (Debian prerelease) (Debian testing/unstable)
>Environment:
System: Linux gsyprf11.external.hp.com 2.4.20-pa18-UP #1 Sat Jan 4 22:06:52 PST 2003 parisc64 unknown unknown GNU/Linux
Architecture: parisc64
>Description:
The following code (extracted from goldedplus), when compiled with g++ -c -O2 bug.cpp, gives:

bug.cpp: In member function `int ftn_golded_nodelist_index::addrcmp() const':
bug.cpp:34: internal compiler error: in cp_expr_size, at cp/cp-lang.c:307
Please submit a full bug report,
with preprocessed source if appropriate.
See <URL:http://www.gnu.org/software/gcc/bugs.html> for instructions.


class ftn_addr {
public:
  unsigned short zone;
  unsigned short net;
  unsigned short node;
  unsigned short point;

  ftn_addr();
  ftn_addr(const ftn_addr& a);
  int  compare(const ftn_addr& other) const;
  ftn_addr& operator=(const ftn_addr& a);
};

#pragma pack(1)

struct _GEIdx {
  ftn_addr addr;       // Node address
  _GEIdx() : addr() {}
};

#pragma pack()

class ftn_golded_nodelist_index {
protected:
  _GEIdx   current;
  ftn_addr searchaddr;
  int      addrcmp() const;

public:
  ftn_golded_nodelist_index();
};

int ftn_golded_nodelist_index::addrcmp() const {
  return searchaddr.compare(current.addr);
}
>How-To-Repeat:
see description
compiles fine with g++-3.2
>Fix:
unknown
>Unformatted:
