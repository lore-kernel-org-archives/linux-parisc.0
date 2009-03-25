From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: kernel/traps.c PARISC_BUG_BREAK_INSN undeclared
Date: Wed, 25 Mar 2009 17:02:21 +0300
Message-ID: <a4423d670903250702k2e5d803jb2caf9f9752f1e0a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

arch/parisc/kernel/traps.c: In function 'handle_break':
arch/parisc/kernel/traps.c:321: error: 'PARISC_BUG_BREAK_INSN'
undeclared (first use in this function)

# CONFIG_BUG is not set
CONFIG_EMBEDDED=y

Is it a reasonable config?
