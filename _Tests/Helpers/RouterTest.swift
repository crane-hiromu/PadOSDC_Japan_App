#if TESTING_ENABLED

import PlaygroundTester

// MARK: - Test
@objcMembers
final class RouterTest: TestCase {
    
    func testRouteToRoot() {
        let target = Router.routeToRoot()
        Assert(target is RootView)
    }
    
    func testRouteToSession() {
        let target = Router.routeToSession(with: .day0)
        Assert(target is SessionView)
    }
    
    func testRouteToSessionList() {
        let target = Router.routeToSessionList()
        Assert(target is SessionListView)
    }
    
    func testRouteToInfo() {
        let target = Router.routeToInfo()
        Assert(target is InfoView)
    }
    
    func testRouteToSessionDetail() {
        let target = Router.routeToSessionDetail(with: .init(track: .a, title: ""))
        Assert(target is SessionDetailView)
    }
    
    func testRouteToUserList() {
        let target = Router.routeToUserList(with: [])
        Assert(target is UserListView)
    }
    
    func testRouteToSns() {
        // NOP
    }
}

#endif
