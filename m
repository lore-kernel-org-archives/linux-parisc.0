Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sj-msg-core-4.cisco.com (sj-msg-core-4.cisco.com [171.71.163.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 98B964830
	for <parisc-linux@lists.parisc-linux.org>; Sun,  6 Jan 2002 02:01:55 -0700 (MST)
Received: from mira-sjc5-9.cisco.com (mira-sjc5-9.cisco.com [171.71.163.32])
	by sj-msg-core-4.cisco.com (8.11.3/8.9.1) with ESMTP id g0691sJ18884
	for <parisc-linux@lists.parisc-linux.org>; Sun, 6 Jan 2002 01:01:54 -0800 (PST)
Date: Sun, 6 Jan 2002 01:01:52 -0800
From: Christian Suder <csuder@cisco.com>
To: parisc-linux@lists.parisc-linux.org
Message-Id: <20020106010152.60f7749b.csuder@cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] [Q] how to get the SP from __jmpbuf / glibc
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

Hello,

trying to convince an application to compile and run on palinux I have the
following problem:

The application tries to figure out the stackpointer with

(_t)->md.context[0].__jmpbuf[JB_SP]

however bits/setjmp.h defines the jmpbuf as:

typedef double __jmp_buf[21];  

so it returns a double which the compiler doesn't like as pointer. A
couple of questions as I'm a) a lousy programmer and b) couldn't find the
basic information on what the CPU stores how.

Is double used to cover 64 bit support ? Isn't there a better way than to
use a floating point variable ? 

How does the information in the __jmpbuf look like ? I don't think the SP
occupies 64 bit ? Would the lower 32 bit be the SP ? 

Is the SP 32 bit at all ? Or is there any funky alignment or indexing or
whatever going on ? Where can I find that information about the CPU ? 

How do I get the SP from the __jmpbuf ? 

Thanks for bearing with my ignorance,

	Christian 
