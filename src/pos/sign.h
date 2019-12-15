// Copyright (c) 2012-2019 The Peercoin developers
// Copyright (c) 2019 The BitGreen Core developers
// Copyright (c) 2019 The BitCorn Core developers
// Distributed under the MIT/X11 software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.
#ifndef BITCORN_POS_SIGN_H
#define BITCORN_POS_SIGN_H

#include <memory>

class CBlock;
class CKeyStore;
class CWallet;

class CBlockSigner {
private:
    CBlock& block;
    std::shared_ptr<CWallet> wallet;

public:
    CBlockSigner(CBlock& blockIn, std::shared_ptr<CWallet> walletIn) : block(blockIn), wallet(walletIn) {}
    bool SignBlock();
    bool CheckBlockSignature();
};

#endif // BITCORN_POS_SIGN_H